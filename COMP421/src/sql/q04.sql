SELECT title, releasedate, rating
FROM review R, movies M
WHERE R.userid IN (SELECT userid
		FROM users
		WHERE email = 'talkiesdude@movieinfo.com')
	AND M.movid = R.movid
ORDER BY 3 DESC, 2, 1
;
