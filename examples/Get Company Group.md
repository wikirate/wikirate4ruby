## Get Company Group

_Company groups select and store Companies according to user preference. Users can group companies according to selected
companies or metric answer values or ranges. Company groups help users to frame research, analysis and comparison._

- _used to help define the scope of Datasets and Projects, and_

- _used to set applicability parameters on Metrics._


This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_company_group` method take as an input either the company group's name or the company group's identifier.

```ruby
# get a company group by name, returns a CompanyGroup object
company_group = client.get_company_group("Apparel 100 Companies")
# prints company names that belong to this company group
puts company_group.companies
# prints the company group as a json
puts company_group.to_json
# prints the raw json response
puts company_group.raw_json
# get a company group by id, returns a CompanyGroup object
company_group = client.get_company_group(5671631)
```