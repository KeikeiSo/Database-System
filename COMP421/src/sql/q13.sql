SELECT title, releasedate
FROM movies M LEFT OUTER JOIN review R
ON M.movid = R.movid
GROUP BY M.movid
HAVING COUNT(R.movid) >= ALL (SELECT COUNT(R.movid)
				FROM movies M, review R
				WHERE M.movid = R.movid
				GROUP BY M.movid)
ORDER BY 2, 1
;
