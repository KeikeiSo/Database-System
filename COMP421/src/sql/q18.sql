WITH huserid AS (
	SELECT userid
	FROM users
	WHERE email = 'cinebuff@movieinfo.com')
, avgrating_for_genres AS (
	SELECT 	genre, AVG(rating) AS avgrating
	FROM moviegenres G, review R
	WHERE G.movid = R.movid
		AND R.userid IN (SELECT userid FROM huserid)
	GROUP BY G.genre
)
SELECT genre
FROM avgrating_for_genres
WHERE avgrating = (SELECT MAX(avgrating)
			FROM avgrating_for_genres)
ORDER BY genre
;	
