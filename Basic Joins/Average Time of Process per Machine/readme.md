# Day 10 – Average Time of Process per Machine

## 📖 Problem
Write a solution to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

Return the result table in any order.

## 🗂️ Schema
Table: Sales  
- machine_id INT  
- process_id INT  
- activity_type enum  
- timestamp float   

## 💡 SQL Solution
```
SELECT
t1.machine_id,
ROUND(AVG(t2.timestamp - t1.timestamp), 3) as processing_time
FROM
Activity t1
JOIN Activity t2 ON t1.machine_id = t2.machine_id
AND t1.activity_type = 'start'
AND t2.activity_type = 'end'
GROUP BY
t1.machine_id
```

## 🧠 Explanation
This query calculates the **average processing time** for each machine based on activity logs.  
- `FROM Activity t1 JOIN Activity t2` joins the **Activity** table to itself (**self-join**) to match **start** and **end** records for the same machine.  
- `ON t1.machine_id = t2.machine_id` ensures that only activities from the **same machine** are compared.  
- `AND t1.activity_type = 'start' AND t2.activity_type = 'end'` pairs each **start event** (`t1`) with its corresponding **end event** (`t2`).  
- `t2.timestamp - t1.timestamp` calculates the **time taken** for a process to complete.  
- `AVG(...)` computes the **average processing time** across all start-end pairs for each machine.  
- `ROUND(..., 3)` formats the result to **three decimal places** for precision.  
- `GROUP BY t1.machine_id` groups the data so the average is calculated **per machine**.

## 🔑 Key Takeaway
Using a **self-join** with conditional matching lets you track **paired events** like start and end times, making it easy to calculate durations and performance metrics.
