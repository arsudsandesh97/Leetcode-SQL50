# Day 14 – Confirmation Rate

## 📖 Problem
Write a solution to find the confirmation rate of each user.

Return the result table in any order.

## 🗂 Schema
Table: Signups  
- user_id INT  
- time_stamp DATETIME  

Table: Confirmations  
- user_id INT  
- time_stamp DATETIME  
- action ENUM('confirmed', 'timeout')  

## 💡 SQL Solution
```sql
SELECT 
  s.user_id,
  ROUND(IFNULL(SUM(c.action = 'confirmed') / COUNT(c.action), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
  ON s.user_id = c.user_id
GROUP BY s.user_id;
```

## 🧠 Explanation
- Start with all users from Signups.  
- Join their confirmation attempts from Confirmations.  
- SUM(c.action = 'confirmed') counts confirmed rows (boolean = 1).  
- COUNT(c.action) counts all attempts.  
- IFNULL(...,0) handles users with no attempts.  
- Rounded to 2 decimals.  

## 🔑 Key Takeaway
Boolean expressions inside SUM() act like counters, simplifying conditional aggregations.
