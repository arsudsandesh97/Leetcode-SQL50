# Day 49 – List the Products Ordered in a Period

## 📖 Problem
Write a solution to get the names of products that have at least `100` units ordered in February 2020 and their amount.

Return the result table in any order.

## 🗂 Schema
Table: Products  
- product_id INT  
- product_name VARCHAR  
- product_category VARCHAR  

Table: Orders  
- product_id INT  
- order_date DATE  
- unit INT  

## 💡 SQL Solution
```sql
SELECT 
  p.product_name,
  SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01'
  AND o.order_date < '2020-03-01'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
```

## 🧠 Explanation
- Filter orders to February 2020.  
- SUM(o.unit) totals units per product.  
- HAVING ensures only totals ≥ 100 remain.  
- JOIN brings product names for clarity.  

## 🔑 Key Takeaway
Use date ranges plus HAVING to filter by aggregate thresholds.
