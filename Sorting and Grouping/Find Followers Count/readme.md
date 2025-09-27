# Day 27 – Find Followers Count

## 📖 Problem
Write a solution that will, for each user, return the number of followers.

Return the result table ordered by user_id in ascending order.

## 🗂 Schema
Table: Followers  
- user_id INT  
- follower_id INT  

## 💡 SQL Solution
```sql
SELECT 
  user_id,
  COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;
```

## 🧠 Explanation
- GROUP BY user_id groups all follower relationships per user.  
- COUNT(follower_id) gives the number of followers.  
- ORDER BY user_id ASC outputs in ascending order.  

## 🔑 Key Takeaway
Aggregate relationship tables with COUNT to get totals per entity.
