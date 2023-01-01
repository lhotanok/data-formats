// Jaké všechny zastávky jsou na lince "EC 120 Valašský expres" z Púchova do Prahy?

MATCH (tl:TrafficLine)-[c:CONTAINS]->(s:Station)
WHERE tl.name = 'EC 120 Valašský expres'
RETURN s.name AS Zastávka
ORDER BY c.order
