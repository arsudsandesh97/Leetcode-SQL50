# Day 16 – Average Selling Price

## 📖 Problem
Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.

Return the result table in any order.

## 🗂 Schema
Table: Prices  
- product_id INT  
- start_date DATE  
- end_date DATE  
- price INT  

Table: UnitsSold  
- product_id INT  
- purchase_date DATE  
- units INT  

## 💡 SQL Solution
```sql
SELECT 
  p.product_id,
  ROUND(COALESCE(SUM(u.units * p.price) / SUM(u.units), 0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
  ON p.product_id = u.product_id
 AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
```

## 🧠 Explanation
- LEFT JOIN aligns unit sales to valid price periods.  
- Multiply units * price to get revenue per batch.  
- Divide total revenue by total units for average price.  
- COALESCE(...,0) ensures products with no sales show 0.  
- Rounded to 2 decimals.  

## 🔑 Key Takeaway
Pair date ranges with joins to apply correct prices over time windows.
