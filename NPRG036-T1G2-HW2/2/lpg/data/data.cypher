// Transport types.
CREATE (Autobus:TransportType {name:'Autobus'}),
       (Tramvaj:TransportType {name:'Tramvaj'}),
       (Metro:TransportType {name:'Metro'}),
       (Vlak:TransportType {name:'Vlak'})

// Stations with their connection to TransportType instance.
CREATE (Púchov:Station {name:'Púchov', latitude:49.1578426, longitude:18.2515321})-[:HAS]->(Vlak),
       (HorníLideč:Station {name:'Horní Lideč'})-[:HAS]->(Vlak),
       (Vsetín:Station {name:'Vsetín'})-[:HAS]->(Vlak),
       (ValašskéMeziříčí:Station {name:'Valašské Meziříčí', latitude:49.4667696, longitude:17.9645671})-[:HAS]->(Vlak),
       (HranicenaMoravě:Station {name:'Hranice na Moravě'})-[:HAS]->(Vlak),
       (LipníknBečvou:Station {name:'Lipník n.Bečvou'})-[:HAS]->(Vlak),
       (Olomouchln:Station {name:'Olomouc hl.n.'})-[:HAS]->(Vlak),
       (Červenka:Station {name:'Červenka', latitude:49.7285807, longitude:16.9846574})-[:HAS]->(Vlak),
       (Mohelnice:Station {name:'Mohelnice'})-[:has]->(Vlak),
       (ZábřehnaMoravě:Station {name:'Zábřeh na Moravě'})-[:HAS]->(Vlak),
       (ČeskáTřebová:Station {name:'Česká Třebová'})-[:HAS]->(Vlak),
       (Choceň:Station {name:'Choceň'})-[:HAS]->(Vlak),
       (Pardubicehln:Station {name:'Pardubice hl.n'})-[:HAS]->(Vlak),
       (Kolín:Station {name:'Kolín'})-[:HAS]->(Vlak),
       (PrahaLibeň:Station {name:'Praha-Libeň'})-[:HAS]->(Vlak),
       (Prahahln:Station {name:'Praha hl.n.', latitude:50.0832409, longitude:14.4324401})-[:HAS]->(Vlak),
       (Českomoravská:Station {name:'Českomoravská', latitude:50.1056193, longitude:14.4914141})-[:HAS]->(Autobus),
       (Českomoravská)-[:HAS]->(Metro),
       (Kobylisy:Station {name:'Kobylisy', latitude:50.1246845, longitude:14.425655})-[:HAS]->(Autobus),
       (Kobylisy)-[:HAS]->(Metro),
       (Kobylisy)-[:HAS]->(Tramvaj),
       (Podhajskápole:Station {name:'Podhajská pole', latitude:50.1296653, longitude:14.4293079})-[:HAS]->(Autobus),
       (SídlištěČimice:Station {name:'Sídliště Čimice', latitude:50.1447635, longitude:14.4326209})-[:HAS]->(Autobus),
       (BíláHora:Station {name:'Bílá hora'})-[:HAS]->(Tramvaj),
       (MalostranskéNáměstí:Station {name:'Malostranské náměstí'})-[:HAS]->(Tramvaj),
       (NádražíHostivař:Station {name:'Nádraží Hostivař'})-[:HAS]->(Tramvaj)

// Departure schedules:
CREATE (Dep_1:Departures {businesDay: '[5:04, 5:24, 5:44, ... ]', saturday: '[5:04, 5:24, 5:44, ... ]', sunday: '[5:04, 5:24, 5:44, ... ]', holidays: '17.11., 24.12., ... '}),
       (Dep_2:Departures {businesDay: '[6:08, 10:08, 12:08, ... ]', saturday: '[6:08, 10:08, 12:08, ... ]', sunday: '[6:08, 10:08, 12:08, ... ]', holidays: '17.11., 24.12., ... '}),
       (Dep_3:Departures {businesDay: '[5:04, 5:14, 5:24, ... ]', saturday: '[5:04, 5:14, 5:24, ... ]', sunday: '[5:04, 5:14, 5:24, ... ]', holidays: '17.11., 24.12., ... '})

// TrafficLines with their has, follows and contains edges.
// Traffic line has transport type.
//              follows departure times.
//              contains ordered sequence of stations.

// First traffic line train Valaššský express from Slovakia to Prague:
CREATE (TL_1:TrafficLine {name: 'EC 120 Valašský expres'})-[:HAS]->(Vlak),
       (TL_1)-[:FOLLOWS]->(Dep_2),
       (TL_1)-[:CONTAINS {order:0, minutesToNext:25}]->(Púchov),
       (TL_1)-[:CONTAINS {order:1, minutesToNext:20}]->(HorníLideč),
       (TL_1)-[:CONTAINS {order:2, minutesToNext:18}]->(Vsetín),
       (TL_1)-[:CONTAINS {order:3, minutesToNext:20}]->(ValašskéMeziříčí),
       (TL_1)-[:CONTAINS {order:4, minutesToNext:10}]->(HranicenaMoravě),
       (TL_1)-[:CONTAINS {order:5, minutesToNext:22}]->(LipníknBečvou),
       (TL_1)-[:CONTAINS {order:6, minutesToNext:12}]->(Olomouchln),
       (TL_1)-[:CONTAINS {order:7, minutesToNext:12}]->(Červenka),
       (TL_1)-[:CONTAINS {order:8, minutesToNext:9}]->(Mohelnice),
       (TL_1)-[:CONTAINS {order:9, minutesToNext:24}]->(ZábřehnaMoravě),
       (TL_1)-[:CONTAINS {order:10, minutesToNext:25}]->(ČeskáTřebová),
       (TL_1)-[:CONTAINS {order:11, minutesToNext:20}]->(Choceň),
       (TL_1)-[:CONTAINS {order:12, minutesToNext:21}]->(Pardubicehln),
       (TL_1)-[:CONTAINS {order:13, minutesToNext:39}]->(Kolín),
       (TL_1)-[:CONTAINS {order:14, minutesToNext:7}]->(PrahaLibeň),
       (TL_1)-[:CONTAINS {order:15, minutesToNext:0}]->(Prahahln)

// Second traffic line. Bus number 152 from Českomoravská to Sídliště Čimice.
CREATE (TL_2:TrafficLine {name: '152'})-[:HAS]->(Autobus),
       (TL_2)-[:FOLLOWS]->(Dep_1),
       (TL_2)-[:CONTAINS {order:0, minutesToNext:3}]->(Českomoravská),
       (TL_2)-[:CONTAINS {order:8, minutesToNext:1}]->(Kobylisy),
       (TL_2)-[:CONTAINS {order:12, minutesToNext:1}]->(Podhajskápole),
       (TL_2)-[:CONTAINS {order:17, minutesToNext:0}]->(SídlištěČimice)

// Third traffic line. Tram number 22 from Bílá Hora to Nádraží Hostivař.
CREATE (TL_3:TrafficLine {name: '22'})-[:HAS]->(Tramvaj),
       (TL_3)-[:FOLLOWS]->(Dep_3),
       (TL_3)-[:CONTAINS {order:0, minutesToNext:2}]->(BíláHora),
       (TL_3)-[:CONTAINS {order:5, minutesToNext:1}]->(MalostranskéNáměstí),
       (TL_3)-[:CONTAINS {order:15, minutesToNext:0}]->(NádražíHostivař)

// Tickets:
CREATE (DestinationTicket_1:DestinationTicket {id:1, validFrom:'2002-01-01', validTo: '2003-01-01'})-[:FROM]->(Púchov),
       (DestinationTicket_1)-[:TO]->(Prahahln),
       (TimeTicket_2:TimeTicket {id:2, validFrom:'2001-01-01', validTo: '3003-01-01'}),
       (TimeTicket_3:TimeTicket {id:3, validFrom:'2022-02-02', validTo: '3022-02-02'})

// Passengers owning tickets:
CREATE (Adam:Passenger {name:'Adam', surname:'Novák'})-[:OWNS]->(DestinationTicket_1),
       (Alice:Passenger {name:'Alice', surname:'Novotná'})-[:OWNS]->(TimeTicket_2),
       (Bedřich:Passenger {name:'Bedřich', surname:'Dvořák'})-[:OWNS]->(TimeTicket_3)