## Get Research Groups

_Research Groups are a collection of WikiRate contributors, their Research Projects, and Metrics they created._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_research_groups` method take as an input a `Hash` where the user can define the parameters of their request.
More specifically, we could divide our params in two different types of parameters, the endpoint parameters and the
filter parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters
allow us to restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_name:_** returns research groups that contain in their name the given string

</div>

In the example below, we are looking for research groups that contain in their name the string _University of Nottingham_.

```ruby
research_groups = client.get_research_groups({ 'name' => 'University of Nottingham' })
puts research_groups
```