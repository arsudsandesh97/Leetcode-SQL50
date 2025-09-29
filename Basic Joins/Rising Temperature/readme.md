# Day 9 – Rising Temperature

## 📖 Problem
Find the IDs of days where the temperature was higher than the day before.

## 🗂️ Schema
Table: Weather  
- id INT  
- recordDate DATE  
- temperature INT  

## 💡 SQL Solution
```sql
SELECT t1.id as id
FROM Weather t1
JOIN Weather t2
WHERE DATEDIFF(t1.recordDate,t2.recordDate) = 1
AND t1.temperature > t2.temperature
```

## 🧠 Explanation
This query finds the **IDs of days that were hotter than the previous day**.  
- `FROM Weather t1 JOIN Weather t2` joins the **Weather** table to itself (a **self-join**) to compare **two different rows**:  
  - `t1` represents **today's record**.  
  - `t2` represents **yesterday's record**.  
- `WHERE DATEDIFF(t1.recordDate, t2.recordDate) = 1` ensures that the date in `t1` is **exactly one day after** the date in `t2`.  
- `AND t1.temperature > t2.temperature` filters results to include only those days where **today's temperature was higher** than yesterday's.  
- `SELECT t1.id AS id` retrieves the **ID of the hotter day**.  

## 🔑 Key Takeaway
A **self-join** lets you compare rows within the **same table**, making it perfect for tasks like tracking **day-to-day changes**.
