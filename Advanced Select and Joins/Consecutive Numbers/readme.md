# Day 33 – Consecutive Numbers

## 📖 Problem
Find all numbers that appear at least three times consecutively.

Return the result table in any order.

## 🗂 Schema
Table: Logs  
- id INT  
- num VARCHAR  

## 💡 SQL Solution
```sql
SELECT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id - l2.id = 1
  AND l2.id - l3.id = 1
  AND l1.num = l2.num
  AND l2.num = l3.num
GROUP BY l1.num;
```

## 🧠 Explanation
- Compare three consecutive rows (id difference of 1).  
- Ensure num values match across all three.  
- GROUP BY removes duplicates so each number appears once.  

## 🔑 Key Takeaway
Using self-joins with offset conditions detects consecutive repeating values.
