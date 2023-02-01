## Add Source

_**All answers on WikiRate are sourced.** A source is generally a company report, including CSR Report, Sustainability
Report, Annual Report or Integrated Report. It could also be a news article, website, conflict mineral report or modern
slavery report and so on. A source can be added to WikiRate as a URL or file upload. Once a source is added it will
remain on the platform so researchers can easily access the document._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

WikiRate's REST API allows you to create new sources and link them to specific companies. wikirate4ruby provides the
method `add_source` to allow users to add new sources on the platform. The method takes as an input a number of
parameters where all the information about the new source is defined. The parameters can be split into required and
optional.

<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">

required params:

- **_title:_** source title
- **_link:_** the url of the source we want to cite

optional params:

- **_company_**: the company name/id, the source is referring to
- **_year_**: citation year of the report/source
- **_report_type_**: specified report type. Allowed parameter values:

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

The example below demonstrates how to add a new source on the platform:

```ruby
source = client.add_source({ 'title' => 'Conflict Minerals Report',
                             'link' => 'https://www.sec.gov/Archives/edgar/data/320187/000032018722000022/a2022exhibit101.htm',
                             'company' => 'Nike Inc.',
                             'year' => 2021,
                             'report_type' => 'Conflict Minerals Report' })
```