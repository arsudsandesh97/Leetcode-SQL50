# Day 1 – Recyclable and Low Fat Products

## 📖 Problem
Write a solution to find the ids of products that are both low fat and recyclable.
Return the result table in any order.

## 🗂️ Schema
Table: Products  
- product_id INT  
- low_fats ENUM('Y','N')  
- recyclable ENUM('Y','N')  

## 💡 SQL Solution
```
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y'

```
## 🧠 Explanation
We filter the Products table using two conditions in the WHERE clause.  
Only rows where both low_fats = 'Y' and recyclable = 'Y' are true will appear.  
If either one fails, the row is excluded.  

## 🔑 Key Takeaway
AND ensures multiple conditions must all be satisfied before a row passes.
