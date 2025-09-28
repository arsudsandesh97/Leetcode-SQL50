# Day 39 – Movie Rating

## 📖 Problem
Write a solution to:

- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.

- Find the movie name with the highest average rating in `February 2020`. In case of a tie, return the lexicographically smaller movie name.

## 🗂 Schema
Table: Movies  
- movie_id INT  
- title VARCHAR  

Table: Users  
- user_id INT  
- name VARCHAR  

Table: MovieRating  
- movie_id INT  
- user_id INT  
- rating INT  
- created_at DATE  

## 💡 SQL Solution
```sql
(
  SELECT u.name AS results
  FROM Users u
  JOIN MovieRating mr ON u.user_id = mr.user_id
  GROUP BY u.user_id
  ORDER BY COUNT(mr.user_id) DESC, u.name
  LIMIT 1
)
UNION ALL
(
  SELECT m.title AS results
  FROM Movies m
  JOIN MovieRating mr ON m.movie_id = mr.movie_id
  WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
  GROUP BY m.movie_id
  ORDER BY AVG(mr.rating) DESC, m.title
  LIMIT 1
);
```

## 🧠 Explanation
- First query counts ratings per user, picks top (ties by smallest name).  
- Second query filters reviews to Feb 2020, calculates average ratings per movie, picks top.  
- UNION ALL combines both results vertically.  

## 🔑 Key Takeaway
Multiple queries can be combined with UNION ALL to produce multi-part answers in one result.
