# Day 22 – Game Play Analysis IV

## 📖 Problem
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

## 🗂 Schema
Table: Activity  
- player_id INT  
- device_id INT  
- event_date DATE  
- games_played INT  

## 💡 SQL Solution
```sql
SELECT 
  ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
  SELECT player_id, MIN(event_date) 
  FROM Activity
  GROUP BY player_id
);
```

## 🧠 Explanation
- Find each player’s first login date with MIN(event_date).  
- DATE_SUB(event_date, INTERVAL 1 DAY) checks if the current login happened the day after first login.  
- Count distinct players who satisfy this.  
- Divide by total distinct players, round to 2 decimals.  

## 🔑 Key Takeaway
Pairing dates with offsets lets you detect next-day behavior effectively.
