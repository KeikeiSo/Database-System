SELECT title, releasedate
FROM movies M, review R
WHERE M.movid = R.movid
	AND M.movid IN (SELECT movid
			FROM releaselanguages
			WHERE language = 'English'
			INTERSECT
			SELECT movid
			FROM releaselanguages
			WHERE language = 'French')
GROUP BY M.movid
HAVING count(*) >= 5
ORDER BY 2, 1
;
