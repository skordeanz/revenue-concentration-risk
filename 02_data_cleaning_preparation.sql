/* =========================================================
   Country Standardization (Cleaning  Layer)
   ========================================================= */
-- Derived Country_Clean via case- and space-insensitive pattern matching to normalize
-- equivalent country values while preserving the original attribute.
USE adventureworks_subset
go

CREATE VIEW vw_dimgeography_clean
AS
  SELECT geographykey,
         englishcountryregionname AS raw_county,
         CASE
           --United States--
           WHEN Upper(Replace(englishcountryregionname, ' ', '')) LIKE
                '%UNITEDSTATES%'
                 OR Upper(Replace(englishcountryregionname, ' ', '')) IN (
                    'US', 'USA', 'U.S.' ) THEN 'United States'
           -- United Kingdom--
           WHEN Upper(Replace(englishcountryregionname, ' ', '')) LIKE
                '%UNITEDKINGDOM%'
                 OR Upper(Replace(englishcountryregionname, ' ', '')) IN ( 'UK',
                    'U.K.' )
         THEN 'United Kingdom'
           --Australia--
           WHEN Upper(Replace(englishcountryregionname, ' ', '')) LIKE
                '%AUSTRALIA%'
                 OR Upper(Replace(englishcountryregionname, ' ', '')) IN
                    ( 'AUS', 'AUS.' ) THEN 'Australia'
           --Canada--
           WHEN Upper(Replace(englishcountryregionname, ' ', '')) LIKE
                '%CANADA%'
                 OR Upper(Replace(englishcountryregionname, ' ', '')) IN
                    ( 'CAN', 'CAN.' ) THEN 'Canada'
           --France--
           WHEN Upper(Replace(englishcountryregionname, ' ', '')) LIKE
                '%FRANCE%'
                 OR Upper(Replace(englishcountryregionname, ' ', '')) IN ( 'FR',
                    'FR.' )
         THEN 'France'
           --Germany--
           WHEN Upper(Replace(englishcountryregionname, ' ', '')) LIKE
                '%GERMANY%'
                 OR Upper(Replace(englishcountryregionname, ' ', '')) IN
                    ( 'GER', 'GER.' ) THEN 'Germany'
         END                      AS Country_clean
  FROM   dimgeography

go

/* =========================================================
   Time Completeness Validation & profit computaion 
   ========================================================= */
-- Derived sales year view  via CTE's funtion and view to extract complete year for the analysis
-- Prepared row-level profit computation by validating sales and cost fields
CREATE VIEW vw_fact_sales_analysis
AS
  WITH yearcompleteness
       AS (--CTE's function 
          SELECT Year(shipdate)                  AS SalesYear,
                 Count(DISTINCT Month(shipdate)) AS MonthCount,
                 CASE
                   WHEN Count(DISTINCT Month(shipdate)) = 12 THEN 1
                   ELSE 0
                 END                             AS IsCompleteYear
           FROM   dbo.factinternetsales
           GROUP  BY Year(shipdate))
  SELECT fs.salesordernumber,
         fs.salesorderlinenumber,
         fs.productkey,
         fs.customerkey,
         fs.salesterritorykey,
         fs.orderdate,
         fs.shipdate,
         Year(fs.shipdate)  AS SalesYear,
         Month(fs.shipdate) AS SalesMonth,
         pc.englishproductcategoryname,
         ps.englishproductsubcategoryname,
         pd.englishproductname,
         fs.orderquantity,
         fs.unitprice,
         fs.discountamount,
         fs.salesamount,
         fs.totalproductcost,
         CASE
           WHEN fs.salesamount IS NOT NULL
                AND fs.totalproductcost IS NOT NULL THEN
           fs.salesamount - fs.totalproductcost
           ELSE NULL
         END                AS Profit,
         yc.iscompleteyear,
         1                  AS OrderLineCount
  FROM   dbo.factinternetsales fs
         JOIN yearcompleteness yc
           ON Year(fs.shipdate) = yc.salesyear
         JOIN dbo.dimproduct pd
           ON pd.productkey = fs.productkey
         JOIN dbo.dimproductsubcategory ps
           ON ps.productsubcategorykey = pd.productsubcategorykey
         JOIN dbo.dimproductcategory pc
           ON pc.productcategorykey = ps.productcategorykey
  WHERE  yc.iscompleteyear = 1;

go

/* =========================================================
     Customer view 
   ========================================================= */
CREATE VIEW vw_dimcustomers
AS
  SELECT customerkey,
         datefirstpurchase,
         Concat(Trim(firstname), ' ', Trim(lastname)) AS Fullname,
         geographykey
  FROM   dbo.dimcustomer 