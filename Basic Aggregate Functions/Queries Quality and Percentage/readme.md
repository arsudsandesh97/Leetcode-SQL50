# Day 19 – Queries Quality and Percentage

## 📖 Problem
Write a solution to find each query_name, the quality and poor_query_percentage.

Both quality and poor_query_percentage should be rounded to 2 decimal places.

Return the result table in any order.

## 🗂 Schema
Table: Queries  
- query_name VARCHAR  
- result VARCHAR  
- position INT  
- rating INT  

## 💡 SQL Solution
```sql
SELECT 
  query_name,
  ROUND(AVG(1.0 * rating / position), 2) AS quality,
  ROUND(100.0 * SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
```

## 🧠 Explanation
- AVG(rating/position) measures query effectiveness.  
- CASE WHEN rating < 3 flags poor queries.  
- SUM(...) / COUNT(*) calculates their share.  
- Multiply by 100 for percentage.  

## 🔑 Key Takeaway
Conditional aggregation with CASE WHEN is essential for ratio metrics.
