# Day 28 – Biggest Single Number

## 📖 Problem
A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

## 🗂 Schema
Table: MyNumbers  
- num INT  

## 💡 SQL Solution
```sql
SELECT MAX(num) AS num
FROM (
  SELECT num
  FROM MyNumbers
  GROUP BY num
  HAVING COUNT(*) = 1
) AS single_num;
```

## 🧠 Explanation
- GROUP BY num groups identical values.  
- HAVING COUNT(*) = 1 keeps only values appearing once (single numbers).  
- MAX(num) finds the largest among them.  
- If no such numbers exist, MAX returns null.  

## 🔑 Key Takeaway
HAVING is excellent for filtering groups by frequency before further calculations.
