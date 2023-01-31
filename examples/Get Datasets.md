## Get Projects

_Data Sets help structure information on WikiRate by combining Companies and Metrics associated with a particular Topic
or theme._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_datasets` method take as an input a `Hash` where the user can define the parameters of their request. More
specifically, we could divide our params in two different types of parameters, the endpoint parameters and the filter
parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters allow us to
restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_name:_** returns datasets that contain in their name the given string
- **_wikirate_topic_**: returns datasets that fall under the defined wikirate topic. All wikirate topics can be
  found [here](https://wikirate.org/Topic).

</div>

In the example below, we are looking for datasets related to Fashion.

```ruby
datasets = client.get_datasets({ 'wikirate_topic' => 'fashion' })
puts datasets
```