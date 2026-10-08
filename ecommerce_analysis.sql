CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

-- 1. Overall KPIs
SELECT
    COUNT(Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Sales) / COUNT(Order_ID), 2) AS Average_Order_Value
FROM sales_data;

-- 2. Sales by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 3. Sales by State
SELECT
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY State
ORDER BY Total_Sales DESC;

-- 4. Monthly Sales
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;

-- 5. Top 10 Products
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Top 10 Customers
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 7. Profit by Category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 8. Payment Method Analysis
SELECT
    Payment_Mode,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;

-- 9. Sales Channel Analysis
SELECT
    Sales_Channel,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Sales_Channel
ORDER BY Total_Sales DESC;

-- 10. Order Status Analysis
SELECT
    Order_Status,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Order_Status
ORDER BY Total_Orders DESC;
