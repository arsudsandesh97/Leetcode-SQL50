# Day 47 – Second Highest Salary

## 📖 Problem
Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return `null`

## 🗂 Schema
Table: Employee  
- id INT  
- salary INT  

## 💡 SQL Solution
```sql
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
```

## 🧠 Explanation
- The inner query finds the highest salary.  
- The outer MAX finds the largest salary strictly below it.  
- If only one salary exists, result is null.  

## 🔑 Key Takeaway
Nested MAX queries are an elegant way to get the “second best” value.
