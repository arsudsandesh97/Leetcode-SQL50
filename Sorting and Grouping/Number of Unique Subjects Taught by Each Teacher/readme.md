# Day 23 – Number of Unique Subjects Taught by Each Teacher

## 📖 Problem
Write a solution to calculate the number of unique subjects each teacher teaches in the university.

Return the result table in any order.

## 🗂 Schema
Table: Teacher  
- teacher_id INT  
- subject_id INT  
- dept_id INT  

## 💡 SQL Solution
```sql
SELECT 
  teacher_id,
  COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
```

## 🧠 Explanation
- DISTINCT ensures duplicate subject_id across departments are not double-counted.  
- COUNT counts unique subjects per teacher.  
- GROUP BY groups results by teacher.  

## 🔑 Key Takeaway
COUNT(DISTINCT ...) is essential when uniqueness must be preserved across categories.
