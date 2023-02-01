SELECT title, releasedate, COUNT(R.movid) AS numreviews
FROM movies M LEFT OUTER JOIN review R
ON M.movid = R.movid
GROUP BY M.movid
HAVING EXTRACT(YEAR FROM releasedate) = 2021
ORDER BY 3 DESC, 2, 1
;
