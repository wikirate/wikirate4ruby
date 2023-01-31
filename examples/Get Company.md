## Get Company

_Any formal reporting organization (including corporations, NGOs, Universities, etc.) represented as a company on
Wikirate._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_company` method take as an input either the company name or the company's identifier.

```ruby
# get a company by name, returns a Company object
company = client.get_company("Adidas AG")
# prints the company as a json
puts company.to_json
# prints the raw json response
puts company.raw_json
# get a company by id, returns a Company object
company = client.get_company(7217)
```