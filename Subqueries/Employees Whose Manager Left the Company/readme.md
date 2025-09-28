# Day 37 – Employees Whose Manager Left the Company

## 📖 Problem
Find the IDs of the employees whose salary is strictly less than `$30000` and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their `manager_id` set to the manager that left.

Return the result table ordered by `employee_id`.

## 🗂 Schema
Table: Employees  
- employee_id INT  
- name VARCHAR  
- manager_id INT  
- salary INT  

## 💡 SQL Solution
```sql
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id NOT IN (
    SELECT employee_id
    FROM Employees
  )
ORDER BY employee_id;
```

## 🧠 Explanation
- Filter employees with salary <30000.  
- Ensure their manager_id is not present in the employee_id list (manager left).  
- ORDER BY sorts by employee id.  

## 🔑 Key Takeaway
NOT IN combined with subqueries helps detect missing relationships.
