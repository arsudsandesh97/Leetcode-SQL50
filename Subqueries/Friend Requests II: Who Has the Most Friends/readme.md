# Day 41 – Friend Requests II: Who Has the Most Friends

## 📖 Problem
Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

- The prefix name is a string that may contain letters (upper or lower case), digits, underscore `'_'`, period `'.'`, and/or dash `'-'`.  
    The prefix name must start with a letter.

- The domain is `'@leetcode.com'`.
Return the result table in any order.

## 🗂 Schema
Table: RequestAccepted  
- requester_id INT  
- accepter_id INT  
- accept_date DATE  

## 💡 SQL Solution
```sql
SELECT id, COUNT(friend) AS num
FROM (
  SELECT requester_id AS id, accepter_id AS friend FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id, requester_id AS friend FROM RequestAccepted
) RA
GROUP BY id
ORDER BY num DESC
LIMIT 1;
```

## 🧠 Explanation
- UNION ALL flips requester and accepter so each relationship counts both ways.  
- GROUP BY id gathers all friendships per person.  
- COUNT(friend) totals their friends.  
- ORDER BY num DESC LIMIT 1 returns the person with the most.  

## 🔑 Key Takeaway
Model undirected relationships by doubling edges (UNION ALL) before counting.
