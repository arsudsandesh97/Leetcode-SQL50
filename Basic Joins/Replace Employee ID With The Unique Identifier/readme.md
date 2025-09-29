# Day 6 – Replace Employee ID with Unique Identifier

## 📖 Problem
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.

## 🗂️ Schema
Table: Employees  
- employee_id INT  
- name VARCHAR  

Table: EmployeeUNI  
- employee_id INT  
- unique_id INT  

## 💡 SQL Solution
```sql
SELECT
t2.unique_id,
t1.name
FROM Employees t1
LEFT JOIN
EmployeeUNI t2
ON
t1.id = t2.id

```
## 🧠 Explanation
A LEFT JOIN means we keep all employees from the Employees table.  
If a match exists in EmployeeUNI, we bring in the unique_id.  
If not, the unique_id will just be NULL.  

## 🔑 Key Takeaway
Use LEFT JOIN when you want all rows from the left table, even if no matches exist on the right.
