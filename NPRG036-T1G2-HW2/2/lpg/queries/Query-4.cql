// Mezi kterými dvěma zastávkami jede vlak "EC 120 Valašký expres" nejdéle?

MATCH (tl:TrafficLine)-[c:CONTAINS]->(:Station)
WHERE tl.name = 'EC 120 Valašský expres'
WITH c.order AS OrderOfLongest
ORDER BY c.minutesToNext DESC
LIMIT 1

MATCH (tl:TrafficLine)-[c:CONTAINS]->(s:Station)
WHERE (tl.name = 'EC 120 Valašský expres' AND OrderOfLongest = c.order) OR (tl.name = 'EC 120 Valašský expres' AND (OrderOfLongest+1) = c.order )
RETURN s.name AS Zastávky
ORDER BY c.order ASC