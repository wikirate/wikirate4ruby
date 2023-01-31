## Get Dataset

_Data Sets help structure information on WikiRate by combining Companies and Metrics associated with a particular Topic or theme._

This example assumes you have configured your Wikirate REST `client`. Instructions on how to configure a client can be
found in [examples/Configurations.md](https://github.com/wikirate/wikirate4ruby/blob/main/examples/Configuration.md)

The `get_dataset` method take as an input either the dataset name or the dataset's identifier.

```ruby
# get a dataset by name, returns a Dataset object
dataset = client.get_dataset("Tea Transparency Tracker")
# the set of companies the dataset includes
companies = dataset.companies
# the set of metrics the dataset includes
metrics = dataset.metrics
# the answers the dataset includes
answers = dataset.answers
# prints the dataset as a json
puts dataset.to_json
# prints the raw json response
puts company.raw_json
# get a dataset by id, returns a Dataset object
dataset = client.get_dataset(8543400)
```