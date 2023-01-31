## Get Answer

_Wikirate platform helps users to find/research answers on specific questions/metrics about companies. Thus, each answer
is described by the question/metric, company, value, year and source._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_answer` method take as an input either the answer's name or the answer's identifier.

Each answer's name is composed from the metric name (metric designer + metric title), the company name and the year.

```ruby
# get an answer by name, returns an Answer object
answer = client.get_answer("Clean Clothes Campaign+Human Rights Due Diligence Legislation+Adidas AG+2023")
# prints the answer's value
puts answer.value
# prints the answer as a json
puts answer.to_json
# prints the raw json response
puts answer.raw_json
# get an answer by id, returns an Answer object
answer = client.get_answer(13624205)
```