# Day 46 – Delete Duplicate Emails

## 📖 Problem
Write a solution to delete all duplicate emails, keeping only one unique email with the smallest `id`.

For SQL users, please note that you are supposed to write a `DELETE` statement and not a `SELECT` one.

After running your script, the answer shown is the `Person` table. The driver will first compile and run your piece of code and then show the `Person` table. The final order of the `Person` table does not matter.

## 🗂 Schema
Table: Person  
- id INT  
- email VARCHAR  

## 💡 SQL Solution
```sql
DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;
```

## 🧠 Explanation
- JOIN matches duplicate emails.  
- Condition `p1.id > p2.id` ensures larger ids are removed.  
- DELETE removes duplicates, preserving the row with the smallest id.  

## 🔑 Key Takeaway
Self-joins with inequality conditions help prune duplicates while preserving the “first” record.
