SELECT* FROM [dbo].[Sales data]

--Retrieve the total sales for each product category

SELECT Product, SUM(Total_sales) AS Product_total_sales FROM [dbo].[Sales data]
GROUP BY Product;

SELECT Product, SUM (Quantity) AS Quantity_Revenue FROM [dbo].[Sales data]
GROUP BY Product;

--Find the number of sales transactions in each region

SELECT Region, COUNT (customer_id) As Sales_by_region FROM [dbo].[Sales data]
GROUP BY Region;

--find the highest-selling product by total sales value

SELECT Product, COUNT(Total_Sales) AS Product_total_sales FROM [dbo].[Sales data]
GROUP BY Product
ORDER BY Product_total_sales DESC;

SELECT Product, SUM(Total_sales) AS Product_Total_Sales FROM [dbo].[Sales data]
GROUP BY Product
ORDER BY Product_Total_Sales DESC;

--calculate total revenue per product.

SELECT Product, SUM(Total_Sales) AS Product_Total_Sales FROM [dbo].[Sales data]
GROUP BY Product;

--calculate monthly sales totals for the current year

SELECT Orderdate, SUM(Total_Sales) AS TotalSales FROM [dbo].[Sales data]
WHERE Orderdate >='2024-01-01'
GROUP BY Orderdate;

--find the top 5 customers by total purchase amount.

SELECT Region, SUM(Total_Sales) AS RegionSales
FROM [dbo].[Sales data]
GROUP BY Region;

--calculate the percentage of total sales contributed by each region

SELECT Region, SUM(Total_Sales) AS Regionalsales,
(SUM(Total_Sales) / CAST((SELECT SUM(Total_Sales) FROM [dbo].[Sales data])
AS DECIMAL(10,2)) * 100) AS SalesPercentage
FROM [dbo].[Sales data]
GROUP BY Region;


--identify products with no sales in the last quarter.

SELECT DISTINCT Product FROM [dbo].[Sales data]
WHERE Product NOT IN (SELECT Product FROM [dbo].[Sales data]
WHERE OrderDate >= DATEADD (QUARTER, -1, GETDATE()));
