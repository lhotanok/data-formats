// Kolik minut trvá vlaku "EC 120 Valašký expres" cesta ze stanice Púchov do stanice Červenka?

// Otazku si rephrasnem do nasledujicih podotazek:
// Jaký je order Puchova?
// Jaký je order Červenky?
// Jaká je suma minutesToNext CONTAINS hran, krere jsou mezi Puchovem a Červenkou?

MATCH (tl:TrafficLine)
WHERE (tl.name = 'EC 120 Valašský expres')
WITH tl

MATCH (tl)-[c:CONTAINS]->(s:Station)
WHERE s.name = 'Červenka'
WITH tl, c.order AS maxOrder

MATCH (tl)-[c:CONTAINS]->(s:Station)
WHERE s.name = 'Púchov'
WITH tl, maxOrder, c.order AS minOrder

MATCH (tl)-[c:CONTAINS]->(:Station)
WHERE minOrder <= c.order AND c.order < maxOrder 
RETURN sum(c.minutesToNext) AS PocetMinut