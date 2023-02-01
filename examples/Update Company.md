## Update Company

_Any formal reporting organization (including corporations, NGOs, Universities, etc.) represented as a company on
Wikirate._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

WikiRate's REST API allows you not only to create new companies but also to update existing ones. wikirate4ruby provides
the method `update_company` to allow users updating existing companies. The method takes as an input a number of
parameters on a `Hash` object and the users need to define the company and the fields they want to update.

<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">

required params:

- **_company:_** wikirate company name or identifier

optional params:

- **_headquarters:_** the region/country the headquarters of the company are located. All the available wikirate Regions
  can be found [here](https://wikirate.org/Regions).
- **_open_corporates_**: company's open corporates identifier
- **_wikipedia_**: company's page name on wikipedia
- **_sec_cik_**: company's central index key as assigned by US Securities and Exchange Commission (SEC)
- **_os_id:_** company's open supply hub identifier

</div>

In the example below, we are updating Nike Inc. headquarters location.

```ruby
nike = client.add_company({ 'company' => 'Nike Inc.',
                            'headquarters' => 'Oregon (United States)' })
```

Instead of the company name we can use the company's identifier when performing updates:

```ruby
nike = client.add_company({ 'company' => 5800,
                            'headquarters' => 'Oregon (United States)' })
```
