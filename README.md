# Wikirate4ruby

Wikirate4ruby is a ruby library for the [Wikirate API](https://wikirate.org/Use_the_API) licensed under GNU GPL v3.

## Installation

    gem install wikirate4ruby

## Usage

```ruby
# Initializing client
client = Wikirate4ruby::REST::Client.new("YOUR_API_TOKEN")

#get a company given the name or wikirate id
company = client.get_company("Adidas_AG")
#get a company's answers
answers = client.get_company_answers(company.id, { 'year' => 2022 })
#create a new company
wikirate = client.add_company({ 'name' => 'Wikirate International e.V.', 'headquarters' => 'Germany' })
#add answer to metric
address = client.add_research_answer({ 'metric_name' => 'Address',
                                       'metric_designer' => 'Commons',
                                       'year' => 2023,
                                       'value' => "Schlimannstrasse 29, Berlin",
                                       'company' => wikirate.id,
                                       'source' => 'Source-123' })
```

Detail documentation about configuration and all available methods of the client can be found on the next section.

## Documentation

- [Configuration](examples/Configuration.md#configuration)
    - [API-Key](examples/Configuration.md#api-key)
    - [Authentication](examples/Configuration.md#authentication)
- [Get Company](examples/Get%20Company.md#get-company)
- [Get Companies](examples/Get%20Companies.md#get-companies)
- [Add Company](examples/Add%20Company.md#add-company)
- [Update Company](examples/Update%20Company.md)
- [Get Metric](examples/Get%20Metric.md#get-metric)
- [Get Metrics](examples/Get%20Metrics.md#get-metrics)
- [Get Source](examples/Get%20Source.md#get-source)
- [Get Sources](examples/Get%20Sources.md#get-sources)
- [Add Source](examples/Add%20Source.md#add-source)
- [Update Source](examples/Update%20Source.md#update-source)
- [Get Answer](examples/Get%20Answer.md#get-answer)
- [Get Answers](examples/Get%20Answers.md#get-answers)
- [Add Research Metric Answer](examples/Add%20Research%20Metric%20Answer.md#add-research-metric-answer)
- [Update Research Metric Answer](examples/Update%20Research%20Metric%20Answer.md)
- [Get Answers By Metric ID](examples/Get%20Answers.md#get-answers-by-metric-id)
- [Get Relationship Answer](examples/Get%20Relationship%20Answer.md#get-relationship-answer)
- [Get Relationship Answers](examples/Get%20Relationship%20Answers.md#get-relationship-answers)
- [Get Relationship Answers By Metric ID](examples/Get%20Relationship%20Answers.md#get-relationship-answers-by-metric-id)
- [Add Relationship Metric Answer](examples/Add%20Relationship%20Metric%20Answer.md#add-relationship-metric-answer)
- [Update Relationship Metric Answer](examples/Update%20Relationship%20Metric%20Answer.md#update-relationship-metric-answer)
- [Get Topic](examples/Get%20Topic.md#get-topic)
- [Get Topics](examples/Get%20Topics.md#get-topics)
- [Get Dataset](examples/Get%20Dataset.md#get-dataset)
- [Get Datasets](examples/Get%20Datasets.md#get-datasets)
- [Get Company Group](examples/Get%20Company%20Group.md#get-company-group)
- [Get Company Groups](examples/Get%20Company%20Groups.md#get-company-groups)
- [Get Research Group](examples/Get%20Research%20Group.md#get-research-group)
- [Get Research Groups](examples/Get%20Research%20Groups.md#get-research-groups)
- [Get Project](examples/Get%20Project.md#get-project)
- [Get Projects](examples/Get%20Projects.md#get-projects)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wikirate/wikirate4ruby. This project is
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct](https://github.com/[USERNAME]/wikirate4ruby/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Wikirate4ruby project's codebases, issue trackers, chat rooms and mailing lists is expected
to follow the [code of conduct](https://github.com/wikirate/wikirate4ruby/blob/master/CODE_OF_CONDUCT.md).

## 🎉 Acknowledgements

This project was supported by [NLnet foundation](https://nlnet.nl/).

![Image](https://nlnet.nl/logo/banner-160x60.png)