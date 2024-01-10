// Lab2 Exercise 2.1
MATCH (m:Movie{released:2003}) RETURN m

// Lab2 Exercise 2.2
MATCH (m:Movie{released:2006}) RETURN m.title

// Lab2 Exercise 2.3
MATCH(m:Movie) RETURN m.title, m.released, m.tagline


// Lab2 Exercise 2.4
MATCH(m:Movie) RETURN m.title AS `movie title`, m.released AS `released year`, m.tagline AS tagLine

// Lab2 Exercise 3.2
MATCH(m:Movie) -- (p:Person{name:"Tom Hanks"}) RETURN m.title

// Lab2 Exercise3.1
MATCH(p:Person)-[:WROTE]-(m:Movie{title:"Speed Racer"}) RETURN p.name

// Lab2 Exercise3.3
MATCH(m:Movie) -[rel]- (p:Person{name:"Tom Hanks"}) RETURN m.title, type(rel)

// Lab2 Exercise3.4
MATCH(m:Movie) -[rel]- (p:Person{name:"Tom Hanks"}) RETURN m.title,  rel.roles

// Lab2 Exercise3.4
MATCH(m:Movie) -[rel:ACTED_IN]- (p:Person{name:"Tom Hanks"}) RETURN m.title,  rel.roles

// Lab2 Exercise4.1
MATCH(p:Person) -[:ACTED_IN]- (m:Movie) WHERE p.name = "Tom Cruise" RETURN m.title AS `Movie Title`

// Lab2 Exercise4.2
MATCH(p:Person) WHERE 1970 <= p.born <=1979 RETURN p.name AS `Person Name` , p.born AS `Person Born`

// Lab2 Exercise4.3
MATCH(p:Person) -[:ACTED_IN]-> (m:Movie) WHERE p.born > 1960 AND m.title = "The Matrix" RETURN p.name AS PersonName , p.born AS PersonBorn

// Lab2 Exercise4.4
MATCH(p:Person) WHERE p.born IS NULL RETURN p.name AS PersonName

// Lab2 Exercise4.5
MATCH(p:Person)-[rel]->(m:Movie) WHERE rel.rating IS NOT NULL RETURN p.name AS PersonName, m.title AS `Movie Title` , rel.rating AS `Person Rating`

// Lab2 Exercise4.6
MATCH(p:Person) -[rel:REVIEWED]-> (m:Movie) WHERE rel.summary CONTAINS "fun" RETURN m.title AS `Movie Title`, rel.rating AS `Movie Rating`, rel.summary AS `Summary`

// Lab2 Exercise4.7
MATCH(p:Person)-[rel:ACTED_IN]-(m:Movie)-[:ACTED_IN]-(other:Person) WHERE (other) -[:DIRECTED]->(m)  RETURN p.name AS `Person Name`, m.title AS `Movie Title`

// Lab2 Exercise4.8
MATCH(p:Person)-[rel:ACTED_IN]-(m:Movie) WHERE m.title IN rel.roles RETURN m.title AS `Movie Title`, p.name AS `Actor Name`