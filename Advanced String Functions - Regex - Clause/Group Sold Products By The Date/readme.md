# Day 48 – Group Sold Products By The Date

## 📖 Problem
Write a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by `sell_date`.

## 🗂 Schema
Table: Activities  
- sell_date DATE  
- product VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  sell_date,
  COUNT(DISTINCT product) AS num_sold,
  GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
```

## 🧠 Explanation
- COUNT(DISTINCT product) gives number of unique products sold.  
- GROUP_CONCAT lists them lexicographically in one string.  
- GROUP BY sell_date collects results per day.  

## 🔑 Key Takeaway
GROUP_CONCAT is handy to collapse multiple values into one descriptive string.
