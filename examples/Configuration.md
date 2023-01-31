# Configuration

WikiRate data is and always will be free and open. There are, however, more restrictions on API usage for
unauthenticated users. For example, authenticated users can iterate through all results on the get methods (such as
get_companies, get_research_answers etc.)
but anonymous users can get only the first 500. Moreover, only authenticated users can perform operations such as:

- add a new company
- update a company
- add a new source
- update a source
- add a research metric answer
- update a research metric answer
- add a relationship metric answer
- update a relationship metric answer

## API Key

To authenticate you will need an API key, which you can generate from your profile page. To get there, click your
username on the right side of the nav bar at the top of the page, go to the **Account** tab, and click _"Generate Key"_.

Sign up to the wikirate platform [here](https://wikirate.org/new/Sign_up)

## Authentication

Once you have signed up and produce an API key, you are ready to configure your client.

```ruby
require 'wikirate4ruby/client'

# Initializing client
client = Wikirate4ruby::REST::Client.new("YOUR_API_TOKEN")
```


