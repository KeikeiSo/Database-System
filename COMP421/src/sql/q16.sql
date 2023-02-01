WITH comedymovie AS (
	SELECT movid
	FROM moviegenres
	WHERE genre = 'Comedy')
, huserid AS (
	SELECT userid
	FROM users
	WHERE email = 'cinebuff@movieinfo.com')
, havgrating AS (
	SELECT AVG(rating) AS avgrating
	FROM review
	WHERE movid IN (SELECT movid FROM comedymovie)
	AND userid IN (SELECT userid FROM huserid)
	GROUP BY userid)
SELECT title, releasedate, AVG(rating) AS avgrating
FROM movies M, review R
WHERE M.movid = R.movid
	AND M.movid IN (SELECT movid FROM comedymovie)
	AND R.userid NOT IN (SELECT userid FROM huserid)
GROUP BY M.movid
HAVING AVG(rating) >= (SELECT avgrating FROM havgrating)
ORDER BY 3 DESC, 2, 1
;
