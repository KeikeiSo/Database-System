SELECT title, releasedate
FROM movies M LEFT OUTER JOIN review R
ON M.movid = R.movid
GROUP BY M.movid
HAVING count(*) < 2
ORDER BY 2, 1
;
