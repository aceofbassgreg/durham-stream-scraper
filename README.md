DURHAM STREAM SCRAPER
------------------------

This library retrieves data about news, events, and happenings from the Triangle area.

This is in beta form and at the moment only gathers data by retrieving timelines by specified users.

Gathering Tweets from Durham Tweeters
-------------------------

You will need authentication from Twitter and will have to store your keys in a config/twitter_keys.yml file in order to use this library. See config/twitter_client.rb for more details.

To interact via a console session, run 

```ruby
ENV=development bundle exec ./console
```

To import all tweets to pass to the RTP Events API:

```ruby
tg = DurhamScraper::TwitterTimeline.create!
tg.recent_durham_tweets_by_username         
```

This will return Tweet objects (see the twitter gem for additional info)

Importing to Events Service
-------------------------

Clone the Durham Stream Service, install dependencies, and then launch the server locally (see Durham Stream Service README). 

Then, from the command line, run:

```ruby
ENV=development bundle exec ruby bin/import
```

Or, launch a console session and run the following:

```ruby
i = DurhamScraper::Importer.new
i.upload_to_api
```

TO DO:

* Set up to deploy via capistrano
* Write tests for Onboarder
