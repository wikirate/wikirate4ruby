## Update Answer

_Wikirate platform helps users to find/research answers on specific questions/metrics about companies. Thus, each answer
is described by the question/metric, company, value, year and source._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

WikiRate's REST API allows you to update existing answers. wikirate4ruby provides the
method `update_research_metric_answer` to allow users to import answers on metrics. The method takes as an input a
number of parameters where all the information about the existing answer is defined. The parameters can be split into
required and optional.

<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">

required params:

- **_metric_designer_**: the designer of the metric we want to add the answer to
- **_metric_name_**: the metric name/title of the metric we want to add the answer to
- **_company_**: the company name/id the answer is referred to
- **_year_**: the year the answer is referred to

or

- **_answer_id_**: the user can define directly the id of the answer, they want to update, instead of the aformentioned
  paramaters

optional params:

- **_discussion_**: any comments we might have on the answer
- **_value_**: the value/answer to the question
- **_source_**: wikirate's source name of the source we found the answer

</div>

The example below demonstrates the update of an existing answer. Note that, if the answer does not exist if all the
required parameters have been defined a new answer will be created (from the example below the source is missing for
creating a new answer if that answer does not exist)

```ruby
updated_answer = client.update_answer({ 'metric_designer' => 'Walk Free',
                                        'metric_name' => 'MSA Whistleblowing mechanism',
                                        'company' => 'AIB Group plc',
                                        'year' => 2017,
                                        'value' => 'Supply Chain Workers' })
```

