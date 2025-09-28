# Day 40 – Restaurant Growth

## 📖 Problem
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). `average_amount` should be rounded to two decimal places.

Return the result table ordered by `visited_on` in ascending order.

## 🗂 Schema
Table: Customer  
- customer_id INT  
- name VARCHAR  
- visited_on DATE  
- amount INT  

## 💡 SQL Solution
```sql
SELECT 
  visited_on,
  (
    SELECT SUM(amount)
    FROM Customer
    WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
  ) AS amount,
  ROUND((
    SELECT SUM(amount) / 7
    FROM Customer
    WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
  ), 2) AS average_amount
FROM Customer c
WHERE visited_on >= (
  SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
  FROM Customer
)
GROUP BY visited_on
ORDER BY visited_on;
```

## 🧠 Explanation
- Subqueries calculate total and average spending over the past 7 days including current.  
- The WHERE condition ensures only complete 7-day windows are included.  
- GROUP BY visited_on produces results per day.  

## 🔑 Key Takeaway
Windowed aggregations can be simulated using correlated subqueries with date ranges.
