This library retrieves data about news, events, and happenings from the Triangle area.

You will need authentication from Twitter and will have to store your keys in a config/twitter_keys.yml file in order to use this library. See config/twitter_client.rb for more details.

To interact via a console session, run 

`
bundle exec ./console
`

To import all tweets to pass to the RTP Events API:

`
i = RTPScraper::Importer.new
i.import_for_api             #Imports data, formats for api
`

TO DO:

* Set up to deploy via capistrano
* Write tests for Onboarder
* Configure to POST data to RTP Events microservice
* Write RTP Events microservice