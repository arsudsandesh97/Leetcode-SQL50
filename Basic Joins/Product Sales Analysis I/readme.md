# Day 7 – Product Sales Analysis I

## 📖 Problem
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

Return the resulting table in any order.

## 🗂️ Schema
Table: Sales  
- sale_id INT  
- product_id INT  
- year INT  
- quantity INT  
- price INT  

Table: Product  
- product_id INT  
- product_name VARCHAR  

## 💡 SQL Solution
```sql
SELECT
p.product_name,
s.year,
s.price
FROM Sales s
INNER JOIN Product p
ON s.product_id = p.product_id
```

## 🧠 Explanation
This query retrieves the **product name**, **year**, and **price** from two related tables: `Sales` and `Product`.  
- The `FROM Sales s` statement selects the **Sales** table and assigns it an alias `s` for shorter reference.  
- `INNER JOIN Product p` connects the `Sales` table with the **Product** table, aliasing it as `p`.  
- The `ON s.product_id = p.product_id` condition ensures that rows are only included where the `product_id` matches in both tables.  
- Finally, the `SELECT` clause picks three columns to display: `product_name` from the **Product** table and `year`, `price` from the **Sales** table.

## 🔑 Key Takeaway
**INNER JOIN** merges rows from two tables based on a matching column, returning only records that exist in both tables.
