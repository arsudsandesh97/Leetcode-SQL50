# Day 43 – Department Top Three Salaries

## 📖 Problem
Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

## 🗂 Schema
Table: Employee  
- id INT  
- name VARCHAR  
- salary INT  
- departmentId INT  

Table: Department  
- id INT  
- name VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  d.name AS Department,
  e.name AS Employee,
  e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE (
  SELECT COUNT(DISTINCT e2.salary)
  FROM Employee e2
  WHERE e2.departmentId = e.departmentId
    AND e2.salary > e.salary
) < 3
ORDER BY d.name, e.salary DESC, e.name;
```

## 🧠 Explanation
- For each employee, a correlated subquery counts how many distinct salaries are higher in their department.  
- If fewer than 3 are higher, the employee is top-3.  
- JOIN with Department adds department names.  
- ORDER BY organizes results nicely.  

## 🔑 Key Takeaway
Correlated subqueries let you rank values without explicit window functions.

