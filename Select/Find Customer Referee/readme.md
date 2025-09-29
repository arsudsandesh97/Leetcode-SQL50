# Day 2 – Find Customer Referee

## 📖 Problem
Find the names of the customer that are either:

1.referred by any customer with id != 2.

2.not referred by any customer.

Return the result table in any order.

## 🗂️ Schema
Table: Customer  
- id INT  
- name VARCHAR  
- referee_id INT  

## 💡 SQL Solution
```sql
SELECT name
FROM Customer
WHERE
referee_id != 2 OR referee_id IS NULL

```

## 🧠 Explanation
We want customers where referee_id is not equal to 2.  
But if referee_id is NULL (meaning no referee), the != check won’t work.  
That’s why we add OR referee_id IS NULL to include them too.  

## 🔑 Key Takeaway
NULL doesn’t behave like normal values, so you must check it explicitly with IS NULL.
