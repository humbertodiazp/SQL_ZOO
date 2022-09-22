-- 1. Show the total population of the world.
-- world(name, continent, area, population, gdp)
SELECT SUM(population)
FROM world

-- 2. List all the continents - just once each.
SELECT DISTINCT continent FROM world 

-- 3.Give the total GDP of Africa
SELECT SUM(GDP) from world
WHERE continent = 'Africa'

-- 4.How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world
WHERE area >= 1000000;
