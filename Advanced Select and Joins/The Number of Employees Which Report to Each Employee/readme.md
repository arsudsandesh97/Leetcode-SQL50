# Day 30 – The Number of Employees Which Report to Each Employee

## 📖 Problem
Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

## 🗂 Schema
Table: Employees  
- employee_id INT  
- name VARCHAR  
- reports_to INT  
- age INT  

## 💡 SQL Solution
```sql
SELECT 
  e1.employee_id,
  e1.name,
  COUNT(e2.reports_to) AS reports_count,
  ROUND(AVG(e2.age)) AS average_age
FROM Employees e1
JOIN Employees e2
  ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id, e1.name
ORDER BY e1.employee_id;
```

## 🧠 Explanation
- Self-join Employees: e1 as managers, e2 as their direct reports.  
- COUNT(e2.reports_to) counts how many people report to each manager.  
- AVG(e2.age) calculates average report age.  
- ROUND(...) rounds to nearest integer.  
- ORDER BY sorts by manager id.  

## 🔑 Key Takeaway
Self-joins let you explore hierarchical reporting structures in organization data.
