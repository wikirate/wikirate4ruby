## Get Project

_Projects are tools to organize, gather and analyse data on companies' environmental, social and governance performance.
Through Projects you can pull together a specific set of companies (by topic or sector, for example) and metrics to help
you and other WikiRate researchers contribute data that illuminates sustainability performance._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_project` method take as an input either the project name or the project's identifier.

```ruby
# get a project by name, returns a Card object
project = client.get_project("Research: Business Contributions to the SDGs (PRME Research)")
# prints the company as a json
puts project.to_json
# prints the raw json response
puts project.raw_json
# get a company by id, returns a Company object
project = client.get_company(7927459)
```