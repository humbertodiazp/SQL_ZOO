-- 1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

--  2. Give year of 'Citizen Kane'.
 SELECT yr 
 FROM movie
 WHERE title='Citizen Kane'

--  3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). 
-- Order results by year.
SELECT id, title, yr
FROM movie
WHERE title LIKE 'STAR TREK%'
ORDER BY yr