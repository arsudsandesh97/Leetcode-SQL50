# Day 45 – Patients With a Condition

## 📖 Problem
Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with `DIAB1` prefix.

Return the result table in any order.

## 🗂 Schema
Table: Patients  
- patient_id INT  
- patient_name VARCHAR  
- conditions VARCHAR  

## 💡 SQL Solution
```sql
SELECT 
  patient_id,
  patient_name,
  conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';
```

## 🧠 Explanation
- First condition matches if string starts with `DIAB1`.  
- Second matches if `DIAB1` appears later (preceded by a space).  
- Both ensure detection regardless of position.  

## 🔑 Key Takeaway
Use LIKE with careful wildcards to search for codes within text fields.
