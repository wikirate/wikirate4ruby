## Get Company Groups

_Company groups select and store Companies according to user preference. Users can group companies according to selected
companies or metric answer values or ranges. Company groups help users to frame research, analysis and comparison._

- _used to help define the scope of Datasets and Projects, and_

- _used to set applicability parameters on Metrics._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_company_groups` method take as an input a `Hash` where the user can define the parameters of their request.
More specifically, we could divide our params in two different types of parameters, the endpoint parameters and the
filter parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters
allow us to restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_name:_** returns company groups that contain in their name the given string

</div>

In the example below, we are looking for company groups that contain in their name the string _apparel_.

```ruby
company_groups = client.get_company_groups({ 'name' => 'apparel' })
puts company_groups
```