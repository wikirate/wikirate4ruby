## Add Company

_Any formal reporting organization (including corporations, NGOs, Universities, etc.) represented as a company on
Wikirate._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

WikiRate's REST API allows you to create new companies. wikirate4ruby provides the method `add_company` to allow users
to create a new companies. The method takes as an input a number of parameters where all the information about the new
company is defined. The parameters can be split into required and optional. 

<div style="font-family:'Source Code Pro'; font-size:14px; padding-left: 0.5em; padding-right: 0.5em;">

required params:

- **_name:_** company name
- **_headquarters:_** the region/country the headquarters of the company are located. All the available wikirate Regions can be found [here](https://wikirate.org/Regions).

optional params:

- **_open_corporates_**: company's open corporates identifier
- **_wikipedia_**: company's page name on wikipedia
- **_sec_cik_**: company's central index key as assigned by US Securities and Exchange Commission (SEC)
- **_os_id:_** company's open supply hub identifier


</div>

In the example below, we are creating a wikirate company for Nike Inc.

```ruby
nike = client.add_company({ 'name'=> 'Nike Inc.', 
                            'headquarters'=>'United States',
                            'open_corporates'=>'8739914',
                            'sec_cik'=>'0000320187',
                            'os_id'=>'US2020349PNHW2P'})
```

