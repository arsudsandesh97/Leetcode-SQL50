# Day 42 – Investments in 2016

## 📖 Problem
Write a solution to report the sum of all total investment values in 2016 `tiv_2016`, for all policyholders who:

- have the same `tiv_2015` value as one or more other policyholders, and

- are not located in the same city as any other policyholder (i.e., the `(lat, lon)` attribute pairs must be unique).
Round `tiv_2016` to two decimal places.

## 🗂 Schema
Table: Insurance  
- pid INT  
- tiv_2015 FLOAT  
- tiv_2016 FLOAT  
- lat FLOAT  
- lon FLOAT  

## 💡 SQL Solution
```sql
SELECT
ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance i
WHERE i.tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (i.lat, i.lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
  );
```

## 🧠 Explanation
- Subquery 1 finds tiv_2015 values occurring more than once.  
- Subquery 2 keeps only unique (lat, lon).  
- Records meeting both conditions are summed for tiv_2016.  
- ROUND ensures 2-decimal precision.  

## 🔑 Key Takeaway
Use grouped HAVING filters to enforce “shared” and “unique” simultaneously.
