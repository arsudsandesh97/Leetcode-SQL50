# Day 24 – User Activity for the Past 30 Days I

## 📖 Problem
Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

Return the result table in any order.
## 🗂 Schema
Table: Activity  
- user_id INT  
- session_id INT  
- activity_date DATE  
- activity_type ENUM('open_session','end_session','scroll_down','send_message')  

## 💡 SQL Solution
```sql
SELECT 
  activity_date AS day,
  COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-26' AND '2019-07-27'
GROUP BY activity_date;
```

## 🧠 Explanation
- Filter activities to the target 30-day window.  
- COUNT(DISTINCT user_id) ensures each user is only counted once per day.  
- GROUP BY activity_date aggregates by day.  

## 🔑 Key Takeaway
COUNT(DISTINCT ...) is powerful for unique user/activity counts in time windows.
