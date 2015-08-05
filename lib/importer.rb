require 'core'
require 'onboarder'
require 'service_wrapper'
require 'twitter/twitter_importer'

require 'json'
require 'net/http'
require 'uri'

class DurhamScraper::Importer

  attr_reader :twitter_importer, :service_wrapper

  #FIXME => will generalize this later to accept any kind of scraper/grabber
  def initialize
    @twitter_hashtags  = YAML::load(File.open('config/twitter/hashtags.yml','r'))
    @twitter_importer  = DurhamScraper::TwitterImporter.create!
    @service_wrapper   = DurhamScraper::ServiceWrapper.new
  end

  def post_onboarded_data_to_api
    data = onboard_data_for_api
    service_wrapper.upload_to_api(data)
  end

  def tweets_by_category
    twitter_importer.recent_durham_tweets_by_category
  end

  def onboard_data_for_api
    tweets_by_category.map {|category_hash|
      category = category_hash[:category]

      category_hash[:tweets].map { |tweets_by_username|
        process_tweets_by(tweets_by_username,category)
      } 
    }.flatten
  end

  private
  
      def process_tweets_by(tweets_by_username,category)
        tweets_by_username.map { |username, array|
          onboarder = DurhamScraper::Onboarder.new(array)
          processed_tweets = onboarder.process_payload
          processed_tweets.map { |h| 
            h[:author] = "@#{username.to_s}"
            h[:tags] << category unless h[:tags].include?(category)
          }
          processed_tweets
        }.flatten
      end

end