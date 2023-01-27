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
