# Day 35 – Last Person to Fit in the Bus

## 📖 Problem
Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

Note that only one person can board the bus at any given turn.

## 🗂 Schema
Table: Queue  
- person_id INT  
- person_name VARCHAR  
- weight INT  
- turn INT  

## 💡 SQL Solution
```sql
SELECT t1.person_name
FROM Queue t1
JOIN Queue t2
  ON t2.turn <= t1.turn
GROUP BY t1.turn
HAVING SUM(t2.weight) <= 1000
ORDER BY t1.turn DESC
LIMIT 1;
```

## 🧠 Explanation
- Self-join ensures we can accumulate weights up to each person’s turn.  
- SUM(t2.weight) calculates total weight if t1 boards.  
- HAVING <= 1000 filters feasible cases.  
- ORDER BY turn DESC LIMIT 1 picks the last valid person.  

## 🔑 Key Takeaway
Cumulative totals can be simulated with self-joins and HAVING conditions.
