SELECT title, COUNT(R.movid) AS numreviews
FROM movies M LEFT OUTER JOIN review R
ON M.movid = R.movid
GROUP BY M.movid
HAVING releasedate >= ALL (SELECT releasedate 
				FROM movies)
ORDER BY title
;
