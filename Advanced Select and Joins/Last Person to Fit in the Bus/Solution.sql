SELECT t1.person_name
FROM Queue t1
JOIN Queue t2
  ON t2.turn <= t1.turn
GROUP BY t1.turn
HAVING SUM(t2.weight) <= 1000
ORDER BY t1.turn DESC
LIMIT 1;
