## Get Projects

_Projects are tools to organize, gather and analyse data on companies' environmental, social and governance performance.
Through Projects you can pull together a specific set of companies (by topic or sector, for example) and metrics to help
you and other WikiRate researchers contribute data that illuminates sustainability performance._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_projects` method take as an input a `Hash` where the user can define the parameters of their request. More
specifically, we could divide our params in two different types of parameters, the endpoint parameters and the filter
parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters allow us to
restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_name:_** returns projects that contain in their name the given string
- **_wikirate_status_**: returns projects of the given status. Allow parameter values:

    - 'active'
    - 'inactive'

</div>

In the example below, we are looking for all the currently active projects.

```ruby
projects = client.get_projects({ 'wikirate_status' => 'active' })
puts projects
```