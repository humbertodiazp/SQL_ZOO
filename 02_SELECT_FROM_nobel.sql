
-- 1.Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
--  2.Show who won the 1962 prize for literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

-- 3.Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel 
WHERE winner ='Albert Einstein';

-- 4.Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel 
WHERE subject = 'peace'
AND yr >= 2000;
-- 5.Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

-- 6. Show all details of the presidential winners:
-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama



-- 7.Show the winners with first name John