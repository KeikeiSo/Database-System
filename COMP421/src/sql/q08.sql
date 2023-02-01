SELECT uname, email
FROM users U
WHERE EXISTS (SELECT movid
		FROM review R
		WHERE U.userid = R.userid
			AND movid IN (SELECT movid
					FROM releaselanguages
					WHERE language = 'French'
					EXCEPT 
					SELECT movid
					FROM releaselanguages
					WHERE language <> 'French'))
ORDER BY email
;		
