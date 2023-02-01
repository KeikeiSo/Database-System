SELECT title, releasedate, AVG(rating) AS avgrating
FROM movies M, review R
WHERE M.movid = R.movid
GROUP BY M.movid
HAVING COUNT(rating) >= 2
ORDER BY 3 DESC, 2, 1
;
