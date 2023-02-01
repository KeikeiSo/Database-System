WITH lang_genre_nummovies AS (
	SELECT language, genre, COUNT(L.movid) AS numMovies
	FROM releaselanguages L, moviegenres G
	WHERE L.movid = G.movid
	GROUP BY language, genre)
SELECT language, genre
FROM lang_genre_nummovies S1
WHERE S1.numMovies >= ALL (SELECT S2.numMovies
			FROM lang_genre_nummovies S2
			WHERE S1.language = S2.language)
ORDER BY 1, 2
;
