require 'core'
require 'onboarder'
require 'twitter/tweet_grabber'

require 'json'
require 'net/http'

class RTPScraper::Importer

  attr_reader :tweet_grabber

  def initialize
    @tweet_grabber = RTPScraper::TweetGrabber.create!

  end

  def tweets_by_username
    tweet_grabber.recent_durham_tweets_by_username
  end

  def onboard_data_for_api
    tweets_by_username.map { |username, array|
      onboarder = RTPScraper::Onboarder.new(array)
      processed_tweets = onboarder.process_payload
      processed_tweets.map {|h| h[:author] = "@#{username.to_s}"}
      processed_tweets
    }.flatten
  end


  def upload_to_api
    data = onboard_data_for_api
    data.map {|entry|
      entry.to_json

    }
  end

end