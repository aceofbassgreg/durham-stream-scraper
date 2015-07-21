require_relative '../../config/twitter_client'

require 'core'

class RTPScraper::TweetGrabber

Usernames = [
              "ponysaurusbrew",
              "G2B_restaurant",
              "MonutsDonuts",
              "BullCityBurger",
              "DurhamFarmerMkt",
              "SamsQuikShop",
              "bullcityfood",
              "motorcomh",
              "downtowndurham",
              "wholefoods_drh",
              "carpedurham",
              "indyweek",
              "bullcity"
            ]

  attr_reader :client

  def initialize(client)
    @client = client
  end

  def self.create!
    RTPScraper::TweetGrabber.new(Client)
  end

  def recent_durham_tweets_by_username
    @recent_durham_tweets ||= {}.tap do |hash|
      Usernames.map { |username|
        hash[username.to_sym] = client.user_timeline(username)
      }
    end
  end


end