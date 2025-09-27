# Day 4 – Article Views I

## 📖 Problem
Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

## 🗂️ Schema
Table: Views  
- article_id INT  
- author_id INT  
- viewer_id INT  
- view_date DATE  

## 💡 SQL Solution
```
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
```

## 🧠 Explanation
We compare author_id and viewer_id to find cases where the writer is also the viewer.  
DISTINCT ensures we only return each author once, even if they viewed their own article multiple times.  

## 🔑 Key Takeaway
DISTINCT is useful when you want unique values without duplicates.
