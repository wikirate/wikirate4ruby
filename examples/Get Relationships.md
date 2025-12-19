## Get Relationships

_Wikirate platform can host answers that respond to relationship questions between companies. For instance, which
companies supplied company A in 2022? Relationships respond to such questions (metrics with metric type
Relation Metric)._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_relationships` method supports **multiple ways to identify the entity** whose relationships you want to retrieve:

- by `metric_name` **and** `metric_designer`
- by a generic `identifier` (numeric ID or card name)

Additional request options are passed via the `params` hash.

### Method signature

```ruby
get_answers(
  metric_name: nil,
  metric_designer: nil,
  identifier: nil,
  params: {}
)
```

<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_year_**: returns all the relationships reported on the defined year
- **_source_**: returns all relationships that cite the defined source
- **_subject_company_id_**: returns all relationships by subject company id
- **_object_company_id_**: returns all relationships by object company id
- **_subject_company_name_**: returns all relationships by subject company name
- **_object_company_name_**: returns all relationships by object company name
- **_value_**: returns all the relationships with the defined value (e.g. Tier 2 Supplier)
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

## Get Relationships by Metric ID

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