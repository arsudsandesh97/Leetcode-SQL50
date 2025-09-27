# Day 3 – Big Countries

## 📖 Problem
Write a solution to find the name, population, and area of the big countries.

Return the result table in any order.

## 🗂️ Schema
Table: World  
- name VARCHAR  
- continent VARCHAR  
- area INT  
- population INT  
- gdp BIGINT  

## 💡 SQL Solution
```
SELECT 
name, 
population, 
area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
```

## 🧠 Explanation
The OR operator means a row qualifies if at least one condition is true.  
Countries can pass based on area, population, or both.  

## 🔑 Key Takeaway
Use OR when multiple independent conditions allow a row to qualify.
