SELECT movid, title
FROM movies
WHERE EXTRACT(YEAR FROM releasedate) >= 2021
ORDER BY movid
;
