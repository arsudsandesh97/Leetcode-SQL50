# Day 18 – Percentage of Users Attended a Contest

## 📖 Problem
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

## 🗂 Schema
Table: Users  
- user_id INT  
- user_name VARCHAR  

Table: Register  
- contest_id INT  
- user_id INT  

## 💡 SQL Solution
```sql
SELECT 
  contest_id,
  ROUND(COUNT(r.user_id) * 100 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
```

## 🧠 Explanation
- Count registered users per contest.  
- Divide by total user count (SELECT COUNT(*) FROM Users) to get percentage.  
- Multiply by 100 and round to 2 decimals.  
- Final sorting ensures correct order.  

## 🔑 Key Takeaway
Mix aggregation with a subquery to compute ratios against totals.
