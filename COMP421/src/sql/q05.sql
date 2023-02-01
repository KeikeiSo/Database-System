SELECT title, releasedate
FROM movies
WHERE EXTRACT(YEAR FROM releasedate) = 2021
	AND movid IN (SELECT movid
			FROM moviegenres
			WHERE genre = 'Comedy'
			INTERSECT
			SELECT movid
			FROM moviegenres
			WHERE genre = 'Sci-Fi')
ORDER BY 2, 1
;
