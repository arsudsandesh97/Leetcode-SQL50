# Day 5 – Invalid Tweets

## 📖 Problem
Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

## 🗂️ Schema
Table: Tweets  
- tweet_id INT  
- content VARCHAR  

## 💡 SQL Solution
```
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
```

## 🧠 Explanation
We use the CHAR_LENGTH() function to measure how many characters are in content.  
Any tweet with more than 15 characters gets selected.  

## 🔑 Key Takeaway
String functions like CHAR_LENGTH() let you filter rows based on text size.
