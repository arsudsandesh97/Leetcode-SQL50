# Day 34 – Product Price at a Given Date

## 📖 Problem
Write a solution to find the prices of all products on the date 2019-08-16.

Return the result table in any order.

## 🗂 Schema
Table: Products  
- product_id INT  
- new_price INT  
- change_date DATE  

## 💡 SQL Solution
```sql
SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);
```

## 🧠 Explanation
- For products with price history, take the latest change before or on 2019-08-16.  
- UNION adds products without any prior changes, assigning them the default price of 10.  

## 🔑 Key Takeaway
Combine MAX() with date filters to get “latest as of” values; UNION handles missing histories.
