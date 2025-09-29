# Day 44 – Fix Names in a Table

## 📖 Problem
Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by `user_id`.

## 🗂 Schema
Table: Users  
- user_id INT  
- name VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  user_id,
  CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id;
```

## 🧠 Explanation
- LEFT(name,1) extracts the first character; UPPER makes it capital.  
- SUBSTRING(name,2) takes the rest; LOWER makes them lowercase.  
- CONCAT rebuilds the formatted name.  
- ORDER BY ensures output is sorted by user_id.  

## 🔑 Key Takeaway
String functions can standardize formatting directly inside queries.
