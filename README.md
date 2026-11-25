## E-commerce-Customer-Behaviour-Retention-Analysis-SQL-Server-Python-Power-BI
### Overview
#### This project analyzes two years of retail transaction data (December 2009 to December 2011) for IKEA Gifting, a UK-based online retailer specializing in giftware and home decor. The goal is to group customers using RFM (Recency, Frequency, Monetary) analysis, flag churn risk (customers inactive for more than 90 days), and export clean data for reporting and dashboarding.
### Data Structure and Overview:
<img src="https://github.com/Shalu263/E-commerce-Customer-Behaviour-Retention-Analysis-SQL-Server-Python-Power-BI/blob/b5580613f51897a181fadc53b676d5c948ba540a/Gemini_Generated_Image_rma52trma52trma5.png?raw=true" alt="IKEA Gifting Database Structure" width="650" />

 ### Executive Summary

#### Across two years of UK online retail transactions (December 2009 – December 2011), IKEA Gifting generated strong top-line revenue heavily driven by a small core of repeat buyers, while overall customer retention showed significant drop-off. Across **5,881 active customers** and **1,033,036 cleaned transaction records**, **Champions** represent **22.0%** of the buyer base (1,291 customers) yet generate **68.1%** of total revenue (**11.84M**). However, **50.9%** of customers have become inactive (90+ days since last purchase), including **665 high-value buyers** representing **2.38M** in revenue at risk. The following sections break down the key segment trends, churn drivers, and actionable retention opportunities.

<img src="https://github.com/Shalu263/E-commerce-Customer-Behaviour-Retention-Analysis-SQL-Server-Python-Power-BI/blob/d5b4b9a17156a62e2a978ba25288bf8176210ebd/Screenshot%202026-11-25%20180957.png?raw=true" alt="IKEA Gifting Power BI Dashboard Overview" width="750" /> 
### Sales & Revenue Trends:

#### 1) Strong Q4 Gifting Seasonality: Monthly revenue rises steadily from an early-year low of $0.95M in February to a peak of $2.32M in November and $1.77M in December, lifting Q4 revenue to $6.2M—nearly double Q1 ($3.4M) and Q2 ($3.6M).
<img src="https://github.com/Shalu263/E-commerce-Customer-Behaviour-Retention-Analysis-SQL-Server-Python-Power-BI/blob/56d83e6a998233a64d6b70560f785da5351c16a2/Screenshot%202026-11-25%20183548.png?raw=true" alt="IKEA Gifting Dashboard Visual" width="750" />




#### 2) Year-over-Year Scale & Stabilization: Annual revenue surged from $0.7M in 2009 (partial year starting December) to $8.4M in 2010, and held steady at $8.3M in 2011 across 5,881 active customers ($17.4M total revenue, $2.95K average customer value).


#### 3)Geographic Revenue Split: The United Kingdom drives the bulk of revenue at $14.39M across 5,353 customers, while international markets like EIRE ($123.31K), Singapore ($25.32K), and Netherlands ($25.18K) lead in average customer value.










