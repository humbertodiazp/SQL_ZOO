-- 1.
-- How many stops are in the database.
SELECT COUNT(*) FROM stops

-- 2.
-- Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops
WHERE name = 'Craiglockhart'

-- 3.
-- Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name
FROM stops
JOIN route ON id = stop 
WHERE num = '4' 
AND company = 'LRT'

-- 4.
-- The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
--  Run the query and notice the two services that link these stops have a count of 2.
--  Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- 5.
-- Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
	WHERE a.stop = 53 AND b.stop = 149

-- 6.
-- Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
    SELECT a.company, a.num, astop.name, bstop.name FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
	WHERE astop.name = 'Craiglockhart' AND bstop.name = 'London Road'

-- 7.
-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT a.company, a.num
FROM route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
                JOIN stops AS astop ON (a.stop = astop.id)
                JOIN stops AS bstop ON (b.stop = bstop.id)
WHERE astop.name = 'Haymarket' 
AND bstop.name = 'Leith'
GROUP BY company, num
