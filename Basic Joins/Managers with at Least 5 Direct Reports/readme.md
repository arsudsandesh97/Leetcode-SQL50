# Day 13 – Managers with at Least 5 Direct Reports

## 📖 Problem
Write a solution to find managers with at least five direct reports.

Return the result table in any order.

## 🗂 Schema
Table: Employee  
- id INT  
- name VARCHAR  
- department VARCHAR  
- managerId INT  

## 💡 SQL Solution
```sql
SELECT t1.name
FROM Employee t1
JOIN Employee t2 
  ON t1.id = t2.managerId
GROUP BY t1.id, t1.name
HAVING COUNT(t2.id) >= 5;
```

## 🧠 Explanation
- Employee t1 represents managers; t2 represents their reports.  
- By joining on t1.id = t2.managerId, we pair managers with their direct employees.  
- Grouping per manager allows counting their reports.  
- HAVING COUNT(t2.id) >= 5 filters managers with at least 5 reports.  

## 🔑 Key Takeaway
Use self-joins and HAVING to count hierarchical relationships like manager–employee.
