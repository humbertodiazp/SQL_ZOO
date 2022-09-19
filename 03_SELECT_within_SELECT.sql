-- 1.List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
    
-- 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world 
Where continent = 'Europe' AND 
gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom');

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. 
-- Order by name of the country.
SELECT name, continent FROM world
WHERE continent IN
  (SELECT continent 
     FROM world WHERE name='Argentina'
                   OR name='Australia')

-- 4.Which country has a population that is more than United Kingom but less than Germany?
--  Show the name and the population.
SELECT name, population FROM world
WHERE population > (SELECT population FROM world 
WHERE name = 'United Kingdom') AND population < (SELECT  population FROM world WHERE name = 'Germany')

-- 5. Germany (population 80 million) has the largest population of the countries in Europe.
-- Austria (population 8.5 million) has 11% of the population of Germany. Show the name and the 
-- population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name,
    CONCAT(ROUND(100*population/(SELECT population
                    FROM WORLD 
                    WHERE name = 'Germany'))
                    , '%')
FROM world
WHERE continent = 'Europe'

-- 6.
-- Which countries have a GDP greater than every country in Europe? 
-- [Give the name only.] (Some countries may have NULL gdp values
SELECT name 
FROM world  x
WHERE gdp > ALL (SELECT gdp FROM world y WHERE continent = "Europe" and gdp > 0)

-- In that query, world is the name of a table (or possibly a view). The x and y are sometimes called
--  "table aliases" but the technical term is "correlation name." x and y can be used elsewhere in the query 
--  to unambiguously reference which instance of the world table you're using in an expression. 
--  This is important in the expression y.continent=x.continent. Think of a correlation name as a kind of pointer
--  to a series of rows within a table. As the query runs, a query's WHERE clause is evaluated once per row. 
--  So the correlation name references one row at a time.
-- By analogy, you can think of it like this code, which may be more familiar to you:
-- for (x = 0; x < 10; ++x) { 
--   for (y = 5; y < 15; ++y) { 
--     if (x == y) { print("match!"); } 
--   } 
-- } 
-- But in SQL, instead of integers, x and y reference rows in a table.

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

-- 8.List each continent and the name of the country that comes first alphabeticaly 
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent
          AND population>0)

-- 9.Find the continents where all countries have a population <= 25000000.
--  Then find the names of the countries associated with these continents. 
--  Show name, continent and population.
SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0)

-- 10.Some countries have populations more than three times 
-- that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent 
FROM world x 
WHERE population/3 >= ALL
    (SELECT population
     FROM world y
     WHERE y.continent=x.continent
     AND x.name <> y.name)
-- when you do the sub-query that checks population/3 >= (all of y.continent) YOU MUST SPECIFY
--  NOT TO CHECK AGAINST THE SAME COUNTRY; 
-- otherwise you are stating to check that x> x/3 which is always true. 