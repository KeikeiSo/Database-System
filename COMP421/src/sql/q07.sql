SELECT title, releasedate, STRING_AGG (language, ',' ORDER BY language ASC) AS languages
FROM movies M, releaselanguages R
WHERE M.movid = R.movid 
	AND (language = 'French' OR language = 'Italian')
GROUP BY M.movid
ORDER BY 2, 1
;

