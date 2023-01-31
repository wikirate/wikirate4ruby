## Get Answers

_Wikirate platform helps users to find/research answers on specific questions/metrics about companies. Thus, each answer
is described by the question/metric, company, value, year and source._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_answers` method take as an input the `metric_name`, `metric_designer` and a `Hash` where the user can define
the parameters of their request. More specifically, we could divide our params in two different types of parameters, the
endpoint parameters and the filter parameters. The endpoint parameters help us to iterate through our query's results
and the filter parameters allow us to restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_year_**: returns all metric answers of the defined year
- **_verification_**: returns all metric answers of the defined verification status. Allowed parameter values:

    - 'flagged'
    - 'community_added': Unverified - added by community
    - 'steward_added': Unverified - added by steward
    - 'community_verified': Verified by community
    - 'steward_verified': Verified by steward
- **_value_**: returns all metric answers with the defined value
- **_value_from_**: returns all metric answers where their value is greater or equal to the defined value
- **_value_to_**: returns all metric answers where their value is less or equal to the defined value
- **_status_**: returns all metric answers of the defined status. Allowed parameter values:

    - 'exists': Researched - All
    - 'known': Researched with a known value
    - 'unknown': Research with an unknown value
    - 'none': Not researched
    - 'all': Researched and Not researched
- **_source_**: returns all metric answers that cite the defined source
- **_updated_**: returns all metric answers that updated on the defined period. Allowed parameter values:

    - 'today'
    - 'week': current week
    - 'month': current month
- **_dataset_**: returns all metric answers that belong to the define dataset. All available wikirate datasets can be
  found [here](https://wikirate.org/Data%20Set).
- **_company_id_**: returns all metric answers of the defined company given its identifier.
- **_company_name:_** returns all metric answers of companies that contain in their name the given string
- **_company_category:_** returns all metric answers of companies that belong to a given company category. Available
  company categories. Allowed parameter values:
    - 'F': Financial
    - 'H': Health And Education
    - 'I': Infrastructure
    - 'M': Manufacturing
    - 'R': Raw Material Producer
    - 'S': Science And Technology
    - 'W': Wholesale And Retail
    - 'O': Other
- **_company_group:_** returns all metric answers of companies that belong to a given company group. All wikirate
  company groups can be found [here](https://wikirate.org/Company%20Group).
- **_country_**: returns metric answers of companies with headquarters on the given input country. All available
  wikirate country options can be found [here](https://wikirate.org/Core+Country+Value_Options).

</div>

In the example below, we are looking for community verified answers of companies with Direct greenhouse gas (GHG)
emissions (Scope 1) greater or equal to 1M CO2 tonnes in 2021.

```ruby
answers = client.get_answers('Direct greenhouse gas (GHG) emissions (Scope 1), GRI 305-1-a (formerly G4-EN15-a)',
                             'Global Reporting Initiative',
                             { 'year' => 2021,
                               'value_from' => 1000000,
                               'verification' => 'community_verified' })
puts answers
```

In the example below, we are looking for the latest available data on Direct greenhouse gas (GHG) emissions (Scope 1) of
companies located in the United Kingdom

```ruby
answers = client.get_answers('Direct greenhouse gas (GHG) emissions (Scope 1), GRI 305-1-a (formerly G4-EN15-a)',
                             'Global Reporting Initiative',
                             { 'year' => 'latest',
                               'country' => 'United Kingdom' })
puts answers
```

## Get Answers By Metric ID

The `get_answers_by_metric_id` functions similarly with the `get_answers` method but instead of `metric_name`
and `metric_designer` gets as an input the `metric_id`.

Thus, the examples equivalent examples of the previous section using the metric_id will be formulated as follows:

In the example below, we are looking for community verified answers of companies with Direct greenhouse gas (GHG)
emissions (Scope 1) greater or equal to 1M CO2 tonnes in 2021.

```ruby
answers = client.get_answers(826615, { 'year' => 2021,
                                       'value_from' => 1000000,
                                       'verification' => 'community_verified' })
puts answers
```

In the example below, we are looking for the latest available data on Direct greenhouse gas (GHG) emissions (Scope 1) of
companies located in the United Kingdom

```ruby
answers = client.get_answers(826615, { 'year' => 'latest',
                                       'country' => 'United Kingdom' })
puts answers
```