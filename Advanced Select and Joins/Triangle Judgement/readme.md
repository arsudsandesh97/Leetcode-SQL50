# Day 32 – Triangle Judgement

## 📖 Problem
Report for every three line segments whether they can form a triangle.

Return the result table in any order.

## 🗂 Schema
Table: Triangle  
- x INT  
- y INT  
- z INT  

## 💡 SQL Solution
```sql
SELECT 
  x, y, z,
  CASE
    WHEN x + y > z 
     AND y + z > x 
     AND x + z > y 
    THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;
```

## 🧠 Explanation
- A valid triangle requires the sum of any two sides greater than the third.  
- The CASE expression encodes this rule.  
- Returns “Yes” or “No” accordingly.  

## 🔑 Key Takeaway
CASE is useful to apply logical rules directly in SQL outputs.
