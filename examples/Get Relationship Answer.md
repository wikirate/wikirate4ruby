## Get Relationship Answer

_Wikirate platform can host answers that respond to relationship questions between companies. For instance, which
companies supplied company A in 2022? Relationship answers respond to such questions (metrics with metric type
Relationship Metric)._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_relationship_answer` method take as an input either the relationship answer's name or the relationship answer's
identifier.

Each relationship answer's name is described by the metric name (metric designer + metric title), subject company, year
and object company.

```ruby
# get a relationship answer by name, returns an RelationshipAnswer object
answer = client.get_relationship_answer("Commons+Tea Supplied By+Unilever+2021+Beitia Tea")
# prints the relationship answer's value
puts answer.value
# prints the answer as a json
puts answer.to_json
# prints the raw json response
puts answer.raw_json
# get a relationship answer by id, returns an RelationshipAnswer object
answer = client.get_relationship_answer(8144117)
```