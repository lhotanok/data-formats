// Jaká je konečná zastávka linky číslo 152?

MATCH (tl:TrafficLine)-[c:CONTAINS]->(s:Station)
WHERE tl.name = '152'
RETURN s
ORDER BY c.order DESC
LIMIT 1