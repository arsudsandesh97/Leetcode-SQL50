# Day 8 – Customer Who Visited but Did Not Make Transactions

## 📖 Problem
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.
## 🗂️ Schema
Table: Visits  
- visit_id INT  
- customer_id INT  

Table: Transactions  
- transaction_id INT  
- visit_id INT  
- amount INT  

## 💡 SQL Solution
```
SELECT customer_id, 
COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
  ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id;
```

## 🧠 Explanation
This query finds customers who **visited but never made a transaction**, along with the **number of such visits**.  
- `FROM Visits v` selects the **Visits** table and aliases it as `v`.  
- `LEFT JOIN Transactions t` connects the `Visits` table to the **Transactions** table, keeping **all rows from Visits** even if there is **no match** in Transactions.  
- `ON v.visit_id = t.visit_id` links visits to their related transactions using the `visit_id`.  
- `WHERE t.transaction_id IS NULL` filters the results to **only include visits without any transaction**, since unmatched rows will have `NULL` values in the `Transactions` table.  
- `COUNT(*) AS count_no_trans` counts how many such visits occurred for each customer.  
- `GROUP BY customer_id` groups the data so the count is calculated **per customer**. 

## 🔑 Key Takeaway
A **LEFT JOIN** combined with a `WHERE ... IS NULL` filter is a powerful pattern for finding **unmatched records** between two tables.
