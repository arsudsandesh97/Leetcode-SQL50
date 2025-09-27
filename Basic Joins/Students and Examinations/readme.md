# Day 12 – Students and Examinations

## 📖 Problem
Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

## 🗂 Schema
Table: Students  
- student_id INT  
- student_name VARCHAR  

Table: Subjects  
- subject_name VARCHAR  

Table: Examinations  
- student_id INT  
- subject_name VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  s.student_id,
  s.student_name,
  sb.subject_name,
  COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sb
LEFT JOIN Examinations e
  ON s.student_id = e.student_id
 AND sb.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sb.subject_name
ORDER BY s.student_id, sb.subject_name;
```

## 🧠 Explanation
- CROSS JOIN generates all student–subject pairs.  
- LEFT JOIN matches exams taken, if any.  
- COUNT(e.subject_name) counts how many times the student appeared for that subject’s exam.  
- Grouping ensures results are per student and subject.  

## 🔑 Key Takeaway
Combine CROSS JOIN with LEFT JOIN to enforce “all possible pairs” while still counting only actual occurrences.
