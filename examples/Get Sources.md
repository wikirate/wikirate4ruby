## Get Sources

_**All answers on WikiRate are sourced.** A source is generally a company report, including CSR Report, Sustainability
Report, Annual Report or Integrated Report. It could also be a news article, website, conflict mineral report or modern
slavery report and so on. A source can be added to WikiRate as a URL or file upload. Once a source is added it will
remain on the platform so researchers can easily access the document._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_sources` method take as an input a `Hash` where the user can define the parameters of their request. More
specifically, we could divide our params in two different types of parameters, the endpoint parameters and the filter
parameters. The endpoint parameters help us to iterate through our query's results and the filter parameters allow us to
restrict our results based on specific given input.
<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">
endpoint params:

- **_limit:_** default value 20, the maximum number of entries to return. If the value exceeds the maximum, then the
  maximum value will be used.
- **_offset:_** default value 0, the (zero-based) offset of the first item in the collection to return

filter params:

- **_wikirate_title:_** returns sources that contain in their title the given string
- **_wikirate_topic_**: returns sources that fall under the defined wikirate topic. All wikirate topics can be
  found [here](https://wikirate.org/Topic).
- **_year_**: returns sources that referred to the defined year.
- **_wikirate_link_**: returns sources with where the source is linked to a url that contains the specified string
- **_company_name_**: returns sources of companies that their name contain the given string.
- **_report_type_**: returns all sources of the given report type. Allowed parameter values:

    - 'Aggregate Data Report'
    - 'Annual Report'
    - 'Business Responsibility Report'
    - 'Code of Conduct'
    - 'Communication on Progress'
    - 'Company Website'
    - 'Conflict Minerals Report'
    - 'Corporate Accountability Index'
    - 'Corporate Social Responsibility Report'
    - 'Data Breach Report'
    - 'Gender Pay Gap Report'
    - 'Human Rights Policy Document'
    - 'Integrated Report'
    - 'Member List'
    - 'Modern Slavery Registry Submission'
    - 'Modern Slavery Statement'
    - 'Privacy Policy Document'
    - 'Research Document'
    - 'Responsible Investment Transparency Report'
    - 'Signatory List'
    - 'Standard'
    - 'Supplier List'
    - 'Supply Chain Policy document'
    - 'Sustainability Report'
    - 'Terms of Service'

</div>

In the example below, we are looking for Conflict Minerals Reports of Nike's for 2021 coming from the sec.gov.

```ruby
sources = client.get_sources({ 'company_name' => 'Nike Inc.',
                               'wikirate_title' => 'Conflict Minerals',
                               'wikirate_link' => 'sec.gov',
                               'year' => 2021 })
puts sources
```