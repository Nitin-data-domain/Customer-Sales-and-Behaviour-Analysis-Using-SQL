USE [Project-3]

SELECT * FROM customers

-- Ques 1: Which customer age group contributes the highest total purchase value?
SELECT 
    age_group,
    SUM(Purchase_Amount_USD) AS total_revenue
FROM (
    SELECT
        CASE
            WHEN Age < 25 THEN 'Below 25'
            WHEN Age BETWEEN 25 AND 40 THEN '25–40'
            WHEN Age BETWEEN 41 AND 60 THEN '41–60'
            ELSE '60+'
        END AS age_group,
        Purchase_Amount_USD
    FROM dbo.customers
) t
GROUP BY age_group
ORDER BY total_revenue DESC;


-- Ques 2:Which product category generates the highest revenue?
SELECT Category, SUM(Purchase_Amount_USD) AS Total_Revenue
FROM customers
GROUP BY Category

-- Ques 3: Do subscribed customers spend more than non-subscribers?
SELECT Subscription_Status,
       AVG(Purchase_Amount_USD) AS avg_spend,
       SUM(Purchase_Amount_USD) AS total_spend
FROM customers
GROUP BY Subscription_Status;

-- Ques 4:Relationship between review rating and purchase frequency
SELECT Review_Rating,
       AVG(Previous_Purchases) AS avg_past_purchases
FROM customers
GROUP BY Review_Rating
ORDER BY Review_Rating DESC;

-- Ques 5: Highest average purchase amount by item
SELECT Item_Purchased,
       AVG(Purchase_Amount_USD) AS avg_purchase_value
FROM customers
GROUP BY Item_Purchased
ORDER BY avg_purchase_value DESC;

-- Ques 6: Which season generates the highest revenue?
SELECT Season,
       SUM(Purchase_Amount_USD) AS total_revenue
FROM customers
GROUP BY Season
ORDER BY total_revenue DESC;

-- Ques 7: Payment method vs purchase behavior
SELECT Payment_Method,
       AVG(Purchase_Amount_USD) AS avg_spend,
       COUNT(*) AS total_transactions
FROM customers
GROUP BY Payment_Method;

-- Ques 8: Shipping type vs customer rating
SELECT Shipping_Type,
       AVG(Review_Rating) AS avg_rating
FROM customers
GROUP BY Shipping_Type;

-- Ques 9: Revenue by location
SELECT Location,
       SUM(Purchase_Amount_USD) AS total_revenue
FROM customers
GROUP BY Location
ORDER BY total_revenue DESC;

-- Ques 10: Best-performing business combination
-- (Category + Season + Discount + Shipping)
SELECT Category,
       Season,
       Discount_Applied,
       Shipping_Type,
       SUM(Purchase_Amount_USD) AS total_revenue
FROM customers
GROUP BY Category, Season, Discount_Applied, Shipping_Type
ORDER BY total_revenue DESC;


