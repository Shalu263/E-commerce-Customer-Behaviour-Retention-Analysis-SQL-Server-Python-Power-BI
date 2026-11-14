---CHECK ROW_COUNTS FROM IMPORT
SELECT COUNT(*) AS ROWS_2009_2010 FROM [Year 2009-10]
SELECT COUNT(*) AS ROWS_2010_2011 FROM [Year 2010-11]

---COMBINE BOTH YEARS to make a master table AND CONVERY TYPES SAFELY--
SELECT
Invoice,StockCode,Quantity,Description,
COALESCE(
TRY_CONVERT(datetime2,InvoiceDate,120),
TRY_CONVERT(datetime2,InvoiceDate,105)
) AS InvoiceDate,

TRY_CONVERT(decimal(10,2),Price) AS Price,
Customer_ID,Country,'2009-10' AS SourceSheet
INTO dbo.Retail_combined
FROM [Year 2009-10]

UNION ALL
SELECT
Invoice,StockCode,Quantity,Description,
COALESCE(
TRY_CONVERT(datetime2,InvoiceDate,120),
TRY_CONVERT(datetime2,InvoiceDate,105)
) AS InvoiceDate,

TRY_CONVERT(decimal(10,2),Price) AS Price,
Customer_ID,Country,'2010-11' AS SourceSheet
FROM [Year 2010-11]

---CONFIRM THE CONVERSION WORKED CLEANELY---
SELECT COUNT(*) AS Total_rows from [dbo].[Retail_combined];
SELECT COUNT(*) AS Failed_dates from [dbo].[Retail_combined] WHERE InvoiceDate IS NULL;
SELECT COUNT(*) AS Failed_prices from [dbo].[Retail_combined] WHERE Price IS NULL;

-----------------------------------DATA EXPLORATION----------------------------------------------
-------------------------------------------------------------------------------------------------
--Missing CustomerID:
SELECT COUNT(*) AS MISSING_IDS 
FROM [dbo].[Retail_combined] 
WHERE Customer_ID IS NULL

---Finding negative/Zero quantities---
SELECT COUNT(*) AS Negative_Qty
FROM [dbo].[Retail_combined] 
WHERE Quantity<=0

---Missing Description:
SELECT COUNT(*) AS Missing_description
FROM [dbo].[Retail_combined] 
WHERE Description IS NULL

---Exact duplicate rows:

SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country,
       COUNT(*) AS DuplicateCount
FROM [dbo].[Retail_combined]
GROUP BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country
HAVING COUNT(*) > 1;

---Deduplicate and produce cleaned table:-----
WITH Deduped AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country
               ORDER BY (SELECT NULL)
           ) AS RowNum
    FROM [dbo].[Retail_combined]
)

SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country, SourceSheet
INTO RetailCleaned
FROM Deduped
WHERE RowNum = 1;

SELECT * FROM RetailCleaned