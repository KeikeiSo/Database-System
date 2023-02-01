SELECT count(*) AS nummovies
FROM movies
WHERE EXTRACT(YEAR FROM releasedate) = 2021
	AND movid IN (SELECT movid
			FROM moviegenres
			WHERE genre = 'Comedy')
;
