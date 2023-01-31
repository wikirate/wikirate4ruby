## Get Topic

_Topics are a way to organize Metrics and other content into thematic groups._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_topic` method take as an input either the topic name or the topic's identifier.

```ruby
# get a company by name, returns a Topic object
topic = client.get_topic("Environment")
# prints the company as a json
puts topic.to_json
# prints the raw json response
puts topic.raw_json
# get a company by id, returns a Topic object
topic = client.get_topic(39152)
```