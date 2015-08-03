require_relative '../../config/twitter_client'

require 'core'

class DurhamScraper::TwitterTimeline

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
              "bullcity",
              "fullsteam"
            ]

  attr_reader :client

  def initialize(client)
    @client = client
  end

  def self.create!
    DurhamScraper::TwitterTimeline.new(Client)
  end

  def recent_durham_tweets_by_username
    @recent_durham_tweets ||= {}.tap do |hash|
      Usernames.map { |username|
        hash[username.to_sym] = client.user_timeline(username)
      }
    end
  end


end