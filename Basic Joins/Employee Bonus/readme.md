# Day 11 – Employee Bonus

## 📖 Problem
Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.

## 🗂 Schema
Table: Employee  
- empId INT  
- name VARCHAR  
- supervisor INT  
- salary INT  

Table: Bonus  
- empId INT  
- bonus INT  

## 💡 SQL Solution
```sql
SELECT 
  e.name, 
  b.bonus
FROM Employee e
LEFT JOIN Bonus b 
  ON e.empId = b.empId
WHERE b.bonus < 1000 
   OR b.bonus IS NULL;
```
## 🧠 Explanation
- We start with all employees using Employee e.  
- LEFT JOIN Bonus b brings in bonus data if available, otherwise null.  
- The condition b.bonus < 1000 OR b.bonus IS NULL ensures we include employees with either no bonus or a bonus less than 1000.  
- This gives us the employee name alongside the applicable bonus.  

## 🔑 Key Takeaway
Use a LEFT JOIN with a filter condition to handle cases where related data may be missing (null values).
