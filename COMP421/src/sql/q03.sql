SELECT userid
FROM review R1
WHERE movid IN (SELECT movid
		FROM movies
		WHERE title = 'Ben-Hur' 
		AND EXTRACT(YEAR FROM releasedate) = 1959)
	AND rating >= 7
	AND NOT EXISTS (SELECT userid
			FROM review R2
			WHERE R1.userid = R2.userid
			AND movid IN (SELECT movid
					FROM movies
					WHERE title = 'Ben-Hur'
					AND EXTRACT(YEAR FROM releasedate) = 2016)
			AND rating > 4)
ORDER BY userid
;
