# Day 50 – Find Users With Valid E-Mails

## 📖 Problem
Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

- The prefix name is a string that may contain letters (upper or lower case), digits, underscore `'_'`, period `'.'`, and/or dash `'-'`. The prefix name must start with a letter.

- The domain is `'@leetcode.com'`.
Return the result table in any order.

## 🗂 Schema
Table: Users  
- user_id INT  
- name VARCHAR  
- mail VARCHAR  

## 💡 SQL Solution
```sql
SELECT *
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c');
```

## 🧠 Explanation
- REGEXP_LIKE enforces pattern rules.  
- ^ and $ anchor to start and end.  
- [a-zA-Z] requires first char be a letter.  
- [a-zA-Z0-9._-]* allows allowed characters.  
- @leetcode\\.com fixes domain.  

## 🔑 Key Takeaway
Regex filters give fine-grained control over validating text formats like emails.

