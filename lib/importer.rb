require 'core'
require 'onboarder'
require 'twitter/tweet_grabber'

class RTPScraper::Importer

  attr_reader :tweet_grabber

  def initialize
    @tweet_grabber = RTPScraper::TweetGrabber.create!

  end

  def tweets_by_username
    tweet_grabber.recent_durham_tweets_by_username
  end

  def import_for_api
    
    {}.tap do |hash_for_api| 
      tweets_by_username.map { |username, array|
        onboarder = RTPScraper::Onboarder.new(array)
        hash_for_api[username.to_sym] = onboarder.process_payload 
      }
    end
  end

end