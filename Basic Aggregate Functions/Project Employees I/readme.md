# Day 17 – Project Employees I

## 📖 Problem
Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

Return the result table in any order.

## 🗂 Schema
Table: Project  
- project_id INT  
- employee_id INT  

Table: Employee  
- employee_id INT  
- name VARCHAR  
- experience_years INT  

## 💡 SQL Solution
```sql
SELECT 
  p.project_id,
  ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
LEFT JOIN Employee e
  ON p.employee_id = e.employee_id
GROUP BY p.project_id;
```

## 🧠 Explanation
- Join projects to employees on employee_id.  
- Compute AVG(experience_years) per project.  
- ROUND(...,2) ensures 2-digit precision.  

## 🔑 Key Takeaway
Joining and averaging lets you measure group performance or experience.
