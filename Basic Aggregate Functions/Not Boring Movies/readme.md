# Day 15 – Not Boring Movies

## 📖 Problem
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

## 🗂 Schema
Table: Cinema  
- id INT  
- movie VARCHAR  
- description VARCHAR  
- rating FLOAT  

## 💡 SQL Solution
```sql
SELECT *
FROM Cinema
WHERE MOD(id, 2) = 1
  AND description != 'boring'
ORDER BY rating DESC;
```

## 🧠 Explanation
- MOD(id,2) = 1 selects odd IDs.  
- description != 'boring' filters out uninteresting movies.  
- ORDER BY rating DESC prioritizes higher-rated films.  

## 🔑 Key Takeaway
Use MOD() for parity checks and combine multiple filters with logical conditions.
