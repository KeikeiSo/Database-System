WITH huserid AS (
	SELECT userid
	FROM users
	WHERE email = 'cinebuff@movieinfo.com')
, hmovies AS (
	SELECT movid, rating
	FROM review
	WHERE userid IN (SELECT userid FROM huserid))
SELECT email
FROM users U
WHERE EXISTS (SELECT movid
		FROM review R
		WHERE R.userid = U.userid
		AND R.movid IN (SELECT movid FROM hmovies)
		AND ABS(R.rating - (SELECT H.rating 
					FROM hmovies H
					WHERE H.movid = R.movid)) <= 1)
	AND U.userid NOT IN (SELECT userid FROM huserid)
ORDER BY email
;
