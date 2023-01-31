## Get Metric

_A Metric is a tool for measuring. On WikiRate, metrics are used to measure company performance, and they are a way of
asking the same question of many companies. It consists of a question, an About section (which describes why this metric
is important and how it is used), and a Methodology section (which describes how to research the answer)._

_Some metric answers are researched, and their values and source citations are entered directly. Other answers are
dynamically calculated from other answers. [Learn More](https://wikirate.org/About_Metrics)_

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_metric` method take as an input either the metric name or the metric's identifier.

Each metric's name is composed by it's designer+title (eg. Core+Company Report Available).
```ruby
# get a metric by name, returns a Metric object
metric = client.get_metric("Core+Company_Report_Available")
puts metric.question
puts metric.about
puts metric.methodology
# prints the metric type
puts metric.metric_type
# print the formula applied for the calculations if the metric is a Formula metric 
puts metric.formula
# prints the metric as a json
puts metric.to_json
# prints the raw json response
puts metric.raw_json
# get a metric by id, returns a Metric object
metric = client.get_metric(7217)
```