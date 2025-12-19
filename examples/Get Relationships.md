## Get Relationships

_Wikirate platform can host answers that respond to relationship questions between companies. For instance, which
companies supplied company A in 2022? Relationships respond to such questions (metrics with metric type
Relation Metric)._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_relationships` method take as an input the `metric_name`, `metric_designer` and a `Hash` where the user
can define the parameters of their request. More specifically, we could divide our params in two different types of
parameters, the endpoint parameters and the filter parameters. The endpoint parameters help us to iterate through our
query's results and the filter parameters allow us to restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_year_**: returns all the relationships reported on the defined year
- **_source_**: returns all relationships that cite the defined source
- **_name:_** returns all relationships with the subject company name containing the given string

</div>

In the example below, we are looking for Adidas AG suppliers in 2021.

```ruby
relationships = client.get_relationships('Supplied By',
                                         'Commons',
                                         { 'year' => 2021,
                                           'name' => 'Adidas AG' })
puts relationships
```

## Get Relationships By Metric ID

The `get_relationships_by_metric_id` functions similarly with the `get_relationships` method but instead
of `metric_name` and `metric_designer` gets as an input the `metric_id`.

Thus, the examples equivalent examples of the previous section using the metric_id will be formulated as follows:

In the example below, we are looking for Adidas AG suppliers in 2021.

```ruby
relationships = client.get_relationships(2929009,
                                         { 'year' => 2021,
                                           'name' => 'Adidas AG' })
puts relationships
```