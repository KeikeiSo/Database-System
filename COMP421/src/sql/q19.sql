WITH before2019 AS (
	SELECT movid
	FROM review 
	WHERE EXTRACT(YEAR FROM reviewdate) < 2019
	GROUP BY movid
	HAVING AVG(rating) >= 7)
, after2019 AS (
	SELECT movid
	FROM review
	WHERE EXTRACT(YEAR FROM reviewdate) >= 2019
	GROUP BY movid
	HAVING AVG(rating) <= 5)
, noreview AS (
	SELECT B.movid
	FROM before2019 B
	WHERE NOT EXISTS (SELECT R.movid
			FROM review R
			WHERE B.movid = R.movid
				AND EXTRACT(YEAR FROM reviewdate) >= 2019))
SELECT title, releasedate
FROM movies
WHERE movid IN (SELECT movid
		FROM before2019
		INTERSECT
		(SELECT movid
		FROM after2019
		UNION
		SELECT movid
		FROM noreview))
ORDER BY 2, 1
;
