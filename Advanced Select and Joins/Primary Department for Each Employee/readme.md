# Day 31 – Primary Department for Each Employee

## 📖 Problem
Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.

## 🗂 Schema
Table: Employee  
- employee_id INT  
- department_id INT  
- primary_flag ENUM('Y','N')  

## 💡 SQL Solution
```sql
SELECT DISTINCT 
  e1.employee_id, 
  e1.department_id
FROM Employee e1
LEFT JOIN Employee e2
  ON e1.employee_id = e2.employee_id 
 AND e2.primary_flag = 'Y'
WHERE e1.primary_flag = 'Y'
   OR e2.employee_id IS NULL;
```

## 🧠 Explanation
- If an employee has a “Y” flag, that department is clearly primary.  
- If all rows are “N” (only one department exists), the LEFT JOIN produces null for e2, so we keep that row.  
- DISTINCT removes duplicates.  

## 🔑 Key Takeaway
When handling primary vs fallback conditions, combine LEFT JOIN with null checks.
