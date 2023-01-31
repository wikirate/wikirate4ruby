## Get Source

_**All answers on WikiRate are sourced.** A source is generally a company report, including CSR Report, Sustainability Report, Annual Report or Integrated Report.
It could also be a news article, website, conflict mineral report or modern slavery report and so on. A source can be
added to WikiRate as a URL or file upload. Once a source is added it will remain on the platform so researchers can
easily access the document._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_source` method take as an input either the source name or the source's identifier.

```ruby
# get a source by name, returns a Source object
source = client.get_source("Source-000171202")
# prints the source as a json
puts source.to_json
# prints the raw json response
puts source.raw_json
# get a source by id, returns a Source object
source = client.get_source(13946225)
```