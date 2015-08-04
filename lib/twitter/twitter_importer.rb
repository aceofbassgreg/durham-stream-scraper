require_relative '../../config/twitter/twitter_client'
require 'core'

require 'yaml'

class DurhamScraper::TwitterImporter

  attr_reader :client, :usernames

  def initialize(client)
    @client    = client
    @usernames = YAML::load(File.open('config/twitter/twitter_users.yml','r'))
  end

  def self.create!
    DurhamScraper::TwitterImporter.new(Client)
  end

  def recent_durham_tweets_by_category
    @recent_durham_tweets_by_category ||= [].tap do |results_arr|
      usernames.map { |category,usernames_arr|
        results_arr << tweets_by_username(category,usernames_arr)
      }
    end
  end

  def all_tweets_with_durham_tag
    @all_tweets_with_durham_tag ||= search_for_hashtag("#durham")
  end

  private

      def tweets_by_username(category,usernames_arr)
        {}.tap do |category_hash|
          category_hash[:category] = category
          category_hash[:tweets] = usernames_arr.map { |username|
            Hash[username.to_sym, client.user_timeline(username)]
          }
        end
      end

      def search_for_hashtag(hashtag)
        client.search(hashtag)
      end
end