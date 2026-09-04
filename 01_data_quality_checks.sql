/* ________DATA QUALITY CHEACK_________*/ 

-- 1:Can we trust revenue and cost values?

	--DimProduct--
select 
sum(case when StandardCost IS NULL then 1 else 0 end) as Null_StandardCost,
sum(case when  StandardCost=0 then 1 else 0 end) as Zero_StandardCost,
sum(case when  ListPrice  IS NULL then 1 else 0 end) as Null_ListPrice,
sum(case when  ListPrice=0 then 1 else 0 end) as Zero_ListPrice
from dbo.DimProduct
go
	--FactsInternetSales--
select 
sum(case when TotalProductCost IS NULL then 1 else 0 end) as Null_Procductcost ,
sum(case when TotalProductCost=0 then 1 else 0 end) as Zero_ProductCost,
sum(case when  SalesAmount  IS NULL then 1 else 0 end) as Null_SalesAmoiunt,
sum(case when  SalesAmount=0 then 1 else 0 end) as Zero_SalesAmount
from dbo.FactInternetSales
go
 
/* Data Quality Summary: SalesAmount and TotalProductCost are complete for all sales records,
and missing pricing or standard cost values exist only for unsold products,
with no impact on profit erosion or concentration analysis.*/



-- 2:Could geography labels split revenue and hide concentration risk?

select EnglishCountryRegionName, -- checking for diffrent country names 
count(*) as geography_record
from dbo.DimGeography
group by EnglishCountryRegionName
go 

select g.EnglishCountryRegionName, -- checking  how geography inconsistency can fragment revenue visibility 
 sum(f.SalesAmount) as total_regional_sales
from dbo.DimGeography g
 join dbo.FactInternetSales f
 on f.SalesTerritoryKey=g.SalesTerritoryKey
 group by g.EnglishCountryRegionName
 order by total_regional_sales desc
 go  

/* Data Quality Summary:I verified that the same country appears under multiple labels, 
and that this fragments revenue, making geographic concentration 
appear lower than it actually is ,This would understate geographic 
concentration risk if not standardized. */


-- 3:Is our time data safe to use for trend comparison?

select distinct year(ShipDate) as complete_year , --Identify complete vs incomplete years for trend analysis
  count(distinct(MONTH (ShipDate))) as months,
   case 
		when count(distinct(month( ShipDate))) = 12 then 'complete'
		else 'incomplete' end as year_status 
from dbo.FactInternetSales
group by YEAR(ShipDate) 
						
/* Data Quality Summary: 2023–2025 contain full 12 months of data and are safe for trend analysis,
while 2026 is incomplete and excluded to avoid partial-period bias.



