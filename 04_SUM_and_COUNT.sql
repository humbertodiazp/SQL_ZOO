-- 1. Show the total population of the world.
-- world(name, continent, area, population, gdp)
SELECT SUM(population)
FROM world

-- 2. List all the continents - just once each.
SELECT DISTINCT continent FROM world 

-- 3.Give the total GDP of Africa
SELECT SUM(GDP) from world
WHERE continent = 'Africa'