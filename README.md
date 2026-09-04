# Revenue Concentration & Profitability Risk Analysis **|SQL Server | Power BI | Business Intelligence**


## Executive Snapshot (3-Minute Read)
**Business Question**  
Where is revenue concentrated, where is profitability eroding, and what structural risks threaten long-term business sustainability?

**Key Findings**
- 28% of customers generate ~80% of total revenue ($23M of $29M), creating high customer dependency risk  
- Top 10 products contribute 43% of revenue, all concentrated in Mountain Bikes  
- United States and Australia account for 63% of total revenue, exposing geographic concentration risk  
- Profit margin compression was driven by a product mix shift toward low-margin accessories, not pricing or operational inefficiency  

**Why This Matters**  
While topline revenue appeared stable, the business is exposed to hidden concentration and margin risks. Loss of a small number of products, customers, or markets could materially impact financial performance.

**Actionable Recommendations**
- Improve accessory profitability through strategic bundling with high-margin bikes  
- Protect top-revenue customers using a margin-aware loyalty strategy  
- Reduce geographic dependency through phased expansion into underpenetrated markets  

## 📌 Project Overview

This project analyzes sales, product, and customer data for Adventure Works, a multinational bicycle manufacturing and retail company.  
The objective was to identify revenue concentration and profitability risks that are not visible through topline revenue metrics

Leadership raised concerns that while revenue appeared stable or growing, **underlying profitability and concentration risks** may threaten long-term performance.
**as a data analyst within the organization**, this analysis focuses on uncovering those hidden risks and translate them into executive-level insights that support strategic decision-making.


---


## 📊 Executive Summary

### Revenue Concentration
- Revenue is heavily dependent on a small subset of products, customers, and markets. This level of concentration creates structural vulnerability, where the loss of a few key revenue drivers could have a disproportionate financial impact.

- Revenue is primarily concentrated in two markets, increasing exposure to region-specific economic, regulatory, or demand-side shocks.




Implication: Losing any top customer or market creates immediate revenue vulnerability

<img width="1204" height="682" alt="image" src="https://github.com/user-attachments/assets/f5361cd6-4174-43a1-aaa0-3e5d6478cac0" />

---

### Profit Erosion
- Profit declined from $2.0M to $1.15M between Q3 2024 and Q1 2025  
- Margins compressed from 42% to 40% during the same period  

**Root Cause:** Margin decline was driven by an unfavorable shift in product mix toward low-margin accessories, rather than pricing or operational inefficiency.

### Recovery Validation
- By Q3 2025, profit rebounded to $2.25M  
- Margins recovering  to 42% as the sales mix is  shifting  back toward higher-margin bike categories  

**Conclusion:** The profitability issue was strategic (product mix), not executional.

<img width="1219" height="671" alt="image" src="https://github.com/user-attachments/assets/af3c3735-4e5b-448d-b03a-96ff903c3f1e" />



---

## 🔍 Insights Deep Dive


### Revenue Concentration Risk
- Top 10 products generate 42.6% of total revenue ($12.4M of $29M), dominated by Mountain Bike models  
- VIP and Premium customer segments account for 64% of total revenue  
- Just 28% of customers drive nearly 80% of revenue
- Loss of 1–2 VIP customers could reduce revenue by 10–15%

**Risk:** Losing a small subset of products or customers would have an immediate and disproportionate revenue impact.


<img width="548" height="277" alt="image" src="https://github.com/user-attachments/assets/27266401-d93d-493b-9363-e43659ec504d" /><img width="719" height="611" alt="image" src="https://github.com/user-attachments/assets/721d26ef-2479-400e-9f7c-da4d61bd4371" />


---

### Geographic Concentration
- United States: $9.3M (32% of revenue)  
- Australia: $9.0M (31% of revenue)  
- Top 2 markets contribute 63% of total revenue  

**Risk:** Economic or regulatory disruption (recession, tariffs, regulations) in key markets would significantly affect business performance.

<img width="1328" height="774" alt="image" src="https://github.com/user-attachments/assets/a3cd1868-d597-4a78-9a98-45419bb8705d" />

---

### Profit Erosion & Product Mix Shift
- Profit declined from $2.0M to $1.15M between Q3 2024 and Q1 2025  
- Margin compressed from 42% to 40% during the same period  
- Accessories represent 63% of SKUs but contribute less than 15% of total profit.
**Root Cause:** Margin decline was driven by an unfavorable shift in product mix toward low-margin accessories, not pricing or operational inefficiency.
  <img width="687" height="416" alt="image" src="https://github.com/user-attachments/assets/01149fb4-f472-4de4-8beb-fa1ceae86bc8" />

<img width="1306" height="721" alt="image" src="https://github.com/user-attachments/assets/d9a5dbaa-2fe6-418e-9a73-e3804511cb26" />

---

###  RECOVERY VALIDATION 
- Q3 2025: Profit rebounded to $2.25M (+12.5% vs Q3 2024 baseline)
- Margin restoring  to 42% as bike mix will  improve
- **Validated hypothesis:** Problem was product mix, not operational efficiency or pricing
<img width="1306" height="725" alt="image" src="https://github.com/user-attachments/assets/009ae38f-c6c0-4e42-9529-73ac4f2453b2" />

---

## ✅ Recommendations

### Short-Term (Operational & Tactical)
- Bundle low-margin accessories with high-margin bikes to increase AOV by 15–25%  
- Improve accessory margins to an estimated 32–35%  
- Track accessory performance before discontinuing low- or zero-sales SKUs  

---

### Medium-Term (Customer Strategy)
- Implement a tiered, margin-protected loyalty program targeting top 28% of customers  
- Improve VIP retention to ~95%  
- Upsell high-margin products while clearing low-margin inventory  

---

### Long-Term (Risk Diversification)
- Reduce dependency on US and Australia through phased European expansion  
- Scenario analysis indicates meaningful revenue and profit upside while lowering concentration risk  

*All projections are indicative estimates based on observed trends and stated assumptions.*

---

## Insights and recommendations are provided on the following key areas:

- **Revenue Concentration:** Identifying dependency on a small set of products and customer segments.
- **Customer Contribution:** Understanding how revenue is distributed across customer segments rather than individual accounts.
- **Profit Erosion:** Tracking margin trends to detect declining profitability despite steady revenue.
- **Product Profitability:** Highlighting high-revenue products with weak margins that pose sustainability risks.

The SQL queries used to inspect and clean the data for this analysis can be found here [Data_quality_checks](01_data_quality_checks.sql) & [Data_cleaning_Preparation](02_data_cleaning_preparation.sql)

An interactive power bi dashboard used to report and explore trends can be found here [link](revenue%20concentration%20and%20profit%20erosion.pbix) 
 

---
## Data Model & Validation (Supporting Analysis)

- Star schema with fact and dimension tables  
- Row-level profit verified as SalesAmount − TotalProductCost  
- Time-period completeness validated for trend analysis  
- Geographic naming standardized for consistency  
- All KPIs calculated from non-aggregated transactional data

---

## ⚠️ Assumptions & Caveats

### The following assumptions were applied during analysis:

- segmenting 18k customer into catogories to create a pareto analysis 
- Profit calculated at the row level as `SalesAmount − TotalProductCost`, excluding tax and freight.
- Incomplete time periods were excluded from trend analysis.
- Geographic naming standardization applied to resolve

---

## 🛠️ Tools Used

- **SQL** – Data validation, transformation, and analysis  
- **Power BI** – Interactive dashboards and executive reporting  

---
## Appendix

The companies main database structure as seen below consists of Seven tables: FactInternetSales, DimProduct ,DimProductCategory,DimProductSubCategory,DimCustomers,DimGeography,DimDates, with a total row count of 60,398 records.

📌 *Entity Relationship Diagram (ERD)*  
<img width="1032" height="807" alt="Screenshot 2026-02-08 154218" src="https://github.com/user-attachments/assets/3584ff3f-9001-4443-bcbd-df62dbcccfee" />

---
## Contact and Feedback
This project was developed as part of a portfolio demonstrating data analysis capabilities in business intelligence, SQL development, and data visualization. For questions, feedback, or discussion about the analytical approaches used in this project, please feel free to reach out.

Data Analyst: Sourav Sharma

LinkedIn: [Profile](https://linkedin.com/in/skordean)

Email: souravv.works@gmail.com

---
_Analysis Period:2026 | Data Source: Adventure Works Sample Database (Microsoft) | Tools: SQL Server, Power BI_

