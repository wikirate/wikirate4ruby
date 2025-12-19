## Update Relationship

_Wikirate platform can host answers that respond to relationship questions between companies. For instance, which
companies supplied company A in 2022? Relationships respond to such questions (metrics with metric type
Relation Metric)._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

WikiRate's REST API allows you to not only to import but also update existing relationships. wikirate4ruby provides the
method `udpate_relationship` to facilitate this functionality. The method takes as an input a number of
parameters where all the information about the existing relationship and updated fields is defined. The parameters can
be split into required and optional.

<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">

required params:

- **_metric_designer_**: the designer of the metric
- **_metric_name_**: the metric name/title of the metric
- **_subject_company_**: the company name/id of the subject company
- **_object_company_**: the company name/id of the object company
- **_year_**: the year the relationship is referred to

or

- **_answer_id_**: the user can define directly the id of the relationship, they want to update, instead of all the
  aformentioned paramaters

optional params:

- **_value_**: the value/answer to the question
- **_source_**: wikirate's source name of the source we found the mentioned relationship
- **_discussion_**: any comments we might have on the answer

</div>

The example below demonstrates the import of a relationship to the _Commons_ metric _Supplied By_

```ruby
updated_relationship = client.update_relationship({ 'answer_id' => 6228782,
                                                    'year' => 2018 })
```
