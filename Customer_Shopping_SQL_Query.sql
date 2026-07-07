create database customer_shopping;
use customer_shopping;

CREATE TABLE customer_shopping_behavior (
    Customer_ID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Item_Purchased VARCHAR(100),
    Category VARCHAR(50),
    Purchase_Amount_USD DECIMAL(10,2),
    Location VARCHAR(100),
    Size VARCHAR(10),
    Color VARCHAR(30),
    Season VARCHAR(20),
    Review_Rating DECIMAL(2,1),
    Subscription_Status VARCHAR(5),
    Shipping_Type VARCHAR(30),
    Discount_Applied VARCHAR(5),
    Promo_Code_Used VARCHAR(5),
    Previous_Purchases INT,
    Payment_Method VARCHAR(30),
    Frequency_of_Purchases VARCHAR(30)
);


-- 1. Retrieve Total Customers.
select count(customer_id)
from customer_shopping_behavior;

-- 2. Retrieve Total Sales.
select sum(Purchase_amount_Usd) as Total_amount
from customer_shopping_behavior;

-- 3. Find Average Purchase Amount
select round(avg(Purchase_Amount_Usd),2) as Average_Purchase_Amount
from customer_shopping_behavior;

-- 4. Analyze Sales by Gender
select Gender, sum(Purchase_Amount_Usd) as Total_Sales
from customer_shopping_behavior
group by Gender;

-- 5. Analyze Sales by Category
select Category, sum(Purchase_Amount_Usd) as Total_Sales
from customer_shopping_behavior
group by category;

-- 6. Analyze Sales by Season
select Season, sum(Purchase_Amount_Usd) as Total_Sales
from customer_shopping_behavior
group by Season
order by Total_sales desc;

-- 7. Analyze Sales by Subscription Status
SELECT
    Subscription_Status,
    ROUND(SUM(Purchase_Amount_USD),2) AS Total_Sales
FROM customer_shopping_behavior
GROUP BY Subscription_Status;

-- 8. Analyze Shipping Type Performance
SELECT
    Shipping_Type,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Purchase_Amount_USD),2) AS Total_Sales,
    ROUND(AVG(Purchase_Amount_USD),2) AS Average_Order_Value
FROM customer_shopping_behavior
GROUP BY Shipping_Type
ORDER BY Total_Sales DESC;

-- 9. Analyze Payment Method Usage
select Payment_method, 
count(CUSTOMER_ID) as Total_Customers,
sum(Purchase_Amount_Usd) as Total_Sales
from customer_shopping_behavior
group by Payment_method
order by Total_Sales desc;

-- 10. Find Customer Age Distribution
select 
Case 
	when Age between 18 and 25 then '18-25'
	when Age between 26 and 35 then '26-35'
	when Age between 36 and 45 then '36-45'
	when Age between 46 and 55 then '46-55'
	else '55+'
end as Age_Group,
count(Customer_id) AS Total_Customers
from customer_shopping_behavior
Group by Age_Group
Order by Age_Group;

-- 11. Analyze Purchase Frequency
Select
    Frequency_of_Purchases,
    count(Customer_id) AS Total_Customers
From customer_shopping_behavior
Group by Frequency_of_Purchases
Order by  Total_Customers DESC;

-- 12. Identify Highest-Selling Product Category
Select
    Category,
    round(sum(Purchase_Amount_USD),2) AS Total_Sales
From customer_shopping_behavior
Group by Category
Order by Total_Sales DESC
LIMIT 1;

-- 13.Find Average Customer Rating
select round(Avg(Review_rating),1) as Average_rating
from customer_shopping_behavior; 

-- 14 Top 5 Highest Spending Customers
Select
    Customer_Id,
    round(sum(Purchase_Amount_USD),2) AS Total_Sales
from customer_shopping_behavior
group by Customer_Id
Order by Total_Sales DESC
LIMIT 5;



