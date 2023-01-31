## Get Metrics

_A Metric is a tool for measuring. On WikiRate, metrics are used to measure company performance, and they are a way of
asking the same question of many companies. It consists of a question, an About section (which describes why this metric
is important and how it is used), and a Methodology section (which describes how to research the answer)._

_Some metric answers are researched, and their values and source citations are entered directly. Other answers are
dynamically calculated from other answers. [Learn More](https://wikirate.org/About_Metrics)_

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_metrics` method take as an input a `Hash` where the user can define the parameters of their request. More
specifically, we could divide our params in two different types of parameters, the endpoint parameters and the filter
parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters allow us to
restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_name:_**: returns all metrics that contain in their name the given string.
- **_bookmark_**: returns the metrics you have bookmarked, allowed parameter values:

    - 'bookmark'
    - 'nobookmark'
- **_wikirate_topic_**: returns all metrics that fall under the defined wikirate topic. All wikirate topics can be
  found [here](https://wikirate.org/Topic).
- **_designer_**: returns all metrics the given designer created.
- **_published_**: returns all metrics based on status published or not published. Note that only stewards are allowed
  to filter based on status. Allowed parameter values:

    - 'true': for published metrics (default)
    - 'false': for not published metrics
    - 'all': for published and unpublished
- **_metric_type_**: returns all metrics of the given metric type. If you want to learn more about the different
  wikirate metric types follow this [link](https://wikirate.org/About_Metrics). Allowed parameter values:

    - 'researched'
    - 'relationship'
    - 'inverse relationship'
    - 'formula'
    - 'wikirating'
    - 'score'
    - 'descendant'
- **_value_type_**: returns all metric that their answers are of the specified value type. Allowed parameter values:

    - 'number'
    - 'money'
    - 'category'
    - 'multi-category'
    - 'free text'
- **_research_policy_**: returns all metrics that follow the given research policy. Allowed parameter values:

    - 'community assessed'
    - 'designer assessed'
- **_dataset_**: returns all metrics contained on the given dataset. All available wikirate datasets can be
  found [here](https://wikirate.org/Data%20Set).

</div>

In the example below, we are asking to get 50 community assessed metrics which are designed by Walk Free

```ruby
metrics = client.get_metrics({ 'limit' => 50,
                               'research_policy' => 'community assessed',
                               'designer' => 'Walk Free' })
```
