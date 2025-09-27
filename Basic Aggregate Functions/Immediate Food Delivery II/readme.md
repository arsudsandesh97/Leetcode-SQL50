# Day 21 – Immediate Food Delivery II

## 📖 Problem
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

## 🗂 Schema
Table: Delivery  
- delivery_id INT  
- customer_id INT  
- order_date DATE  
- customer_pref_delivery_date DATE  

## 💡 SQL Solution
```sql
WITH order_rank AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS orank
  FROM Delivery
)
SELECT 
  ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 2) AS immediate_percentage
FROM order_rank
WHERE orank = 1;
```

## 🧠 Explanation
- ROW_NUMBER ranks orders per customer by date so we can find their first order.  
- WHERE orank = 1 filters only the first orders.  
- The CASE expression counts how many are immediate.  
- Divide by total first orders, multiply by 100, round to 2 decimals.  

## 🔑 Key Takeaway
Use window functions like ROW_NUMBER to isolate “first” or “earliest” records before applying calculations.
