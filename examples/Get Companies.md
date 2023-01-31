## Get Companies

_Any formal reporting organization (including corporations, NGOs, Universities, etc.) represented as a company on
Wikirate._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_companies` method take as an input a `Hash` where the user can define the parameters of their request. More
specifically, we could divide our params in two different types of parameters, the endpoint parameters and the filter
parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters allow us to
restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_name:_** returns companies that contain in their name the given string
- **_company_category:_** returns companies that belong to a given company category. Allowed parameter values:
    - 'F': Financial
    - 'H': Health And Education
    - 'I': Infrastructure
    - 'M': Manufacturing
    - 'R': Raw Material Producer
    - 'S': Science And Technology
    - 'W': Wholesale And Retail
    - 'O': Other
- **_company_group:_** returns companies that belong to a given company group name. All wikirate company groups can be
  found [here](https://wikirate.org/Company%20Group).
- **_country_**: returns companies with headquarters on the given input country. All available wikirate country options
  can be found [here](https://wikirate.org/Core+Country+Value_Options).

</div>

In the example below, we are asking to the first ten companies under the Financial Sector that are located in Greece.

```ruby
greek_fin_companies = client.get_companies({ 'limit' => 10,
                                             'company_group' => 'F',
                                             'country' => 'Greece' })
```

In the example below, we are searching for companies in the UK which contain in their name the string 'food'.

```ruby
companies = client.get_companies({ 'name' => 'food',
                                   'country' => 'United Kingdom' })
```
