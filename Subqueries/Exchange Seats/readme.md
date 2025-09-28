# Day 38 – Exchange Seats

## 📖 Problem
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by `id` in ascending order.

## 🗂 Schema
Table: Seat  
- id INT  
- student VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  CASE
    WHEN MOD(id, 2) = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
    WHEN MOD(id, 2) = 0 THEN id - 1
    ELSE id
  END AS id,
  student
FROM Seat
ORDER BY id;
```

## 🧠 Explanation
- For odd ids (except the last), add 1 to swap with next.  
- For even ids, subtract 1 to swap with previous.  
- The last odd row remains unchanged.  
- ORDER BY id ensures output is in seat order.  

## 🔑 Key Takeaway
CASE plus arithmetic with MOD() allows pairwise swaps.
