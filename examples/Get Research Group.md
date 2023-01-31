## Get Research Group

_Research Groups are a collection of WikiRate contributors, their Research Projects, and Metrics they created._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_research_group` method take as an input either the research group's name or the research group's identifier.

```ruby
# get a research group by name, returns a ResearchGroup object
research_group = client.get_research_group("University of Nottingham - Modern Slavery Research Group 2020")
# prints the research group as a json
puts research_group.to_json
# prints the raw json response
puts research_group.raw_json
# get a research group by id, returns a ResearchGroup object
research_group = client.get_research_group(2301582)
```