# Day 29 – Customers Who Bought All Products

## 📖 Problem
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

## 🗂 Schema
Table: Customer  
- customer_id INT  
- product_key INT  

Table: Product  
- product_key INT  

## 💡 SQL Solution
```sql
SELECT c.customer_id
FROM Customer c
JOIN Product p
  ON c.product_key = p.product_key
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product);
```

## 🧠 Explanation
- JOIN aligns customer purchases with the product catalog.  
- COUNT(DISTINCT c.product_key) counts unique products purchased.  
- Compare it to the total product count.  
- Equality means the customer bought all products.  

## 🔑 Key Takeaway
Compare group counts against overall totals to detect “complete coverage.”
