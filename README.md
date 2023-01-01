# Public Transport Data Formats

## Installation

### Clone repository
`git clone git@github.com:lhotanok/data-formats.git`

## Tools

### Visual Studio Code

https://code.visualstudio.com/

#### Extensions

- [Stardog RDF Grammars](https://marketplace.visualstudio.com/items?itemName=stardog-union.stardog-rdf-grammars)
- [XML Language Support by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml)

### Diagrams.net

https://www.diagrams.net/

### Apache Jena

- apache-jena – contains the APIs, SPARQL engine, the TDB native RDF database and command line tools
  - riot CLI

- apache-jena-fuseki – the Jena SPARQL server
  - triplestore


https://jena.apache.org/

### Neo4j

https://neo4j.com/download/

### JSON Schema Validator

https://www.jsonschemavalidator.net/

### Jq▶play

https://jqplay.org/

### JSON-LD Playground

https://json-ld.org/playground/

### XSL Transformers

https://xslttest.appspot.com/

https://www.freeformatter.com/xsl-transformer.html

### Prefix.cc - namespace lookup for RDF developers

http://prefix.cc/

### RDF Tabular

https://github.com/ruby-rdf/rdf-tabular

## Commands

### Generate RDF from CSV

- depends on RDF Tabular CLI
- used in HW4

#### Windows
```bash
cd NPRG036-T1G2-HW4/4/csv

rdf serialize --input-format tabular --output-format turtle --minimal --decode-uri --prefixes exdep:https://example.org/resource/departures/,extype:https://example.org/resource/transporttypes/,extrfclnstn:https://example.org/resource/trafficlinestation/,extrfcln:https://example.org/resource/trafficline/,exstation:https://example.org/resource/stations/,expas:https://example.org/resource/passengers/,xsd:https://www.w3.org/TR/xmlschema11-2/,extick:https://example.org/resource/tickets/,ex:https://example.org/vocabulary/ data.csv-metadata.json | Out-File -FilePath .\..\rdf\data.ttl -Encoding oem
```

#### Linux
```bash
cd NPRG036-T1G2-HW4/4/csv

rdf serialize --input-format tabular --output-format turtle --minimal --decode-uri --prefixes exdep:https://example.org/resource/departures/,extype:https://example.org/resource/transporttypes/,extrfclnstn:https://example.org/resource/trafficlinestation/,extrfcln:https://example.org/resource/trafficline/,exstation:https://example.org/resource/stations/,expas:https://example.org/resource/passengers/,xsd:https://www.w3.org/TR/xmlschema11-2/,extick:https://example.org/resource/tickets/,ex:https://example.org/vocabulary/ data.csv-metadata.json > ./../rdf/data.ttl
```