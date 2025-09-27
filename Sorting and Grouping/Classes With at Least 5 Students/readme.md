# Day 26 – Classes With at Least 5 Students

## 📖 Problem
Write a solution to find all the classes that have at least five students.

Return the result table in any order.

## 🗂 Schema
Table: Courses  
- student VARCHAR  
- class VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  class
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;
```

## 🧠 Explanation
- GROUP BY class gathers all students of the same class.  
- HAVING COUNT(class) >= 5 keeps only classes with 5 or more students.  

## 🔑 Key Takeaway
HAVING is the filter you apply **after aggregation**, unlike WHERE which filters before grouping.
