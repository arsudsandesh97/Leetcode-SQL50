# Day 25 – Product Sales Analysis III

## 📖 Problem
Write a solution to find all sales that occurred in the first year each product was sold.

For each product_id, identify the earliest year it appears in the Sales table.

Return all sales entries for that product in that year.

Return a table with the following columns: product_id, first_year, quantity, and price.
Return the result in any order.

## 🗂 Schema
Table: Sales  
- sale_id INT  
- product_id INT  
- year INT  
- quantity INT  
- price INT  

## 💡 SQL Solution
```sql
SELECT 
  product_id,
  year AS first_year,
  quantity,
  price
FROM Sales
WHERE (product_id, year) IN (
  SELECT product_id, MIN(year)
  FROM Sales
  GROUP BY product_id
);
```

## 🧠 Explanation
- Subquery finds the earliest year per product.  
- WHERE (product_id, year) IN (...) ensures we only keep those earliest-year sales.  
- The result includes all sales in that first year.  

## 🔑 Key Takeaway
Use MIN() with GROUP BY to capture “first occurrence” and join it back for detailed rows.
