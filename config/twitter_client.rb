require 'yaml'
require 'twitter'

twitter_keys = YAML::load(File.open("config/twitter_keys.yml","r"))

Client = Twitter::REST::Client.new do |config|
  config.consumer_key    = twitter_keys["consumer_key"]
  config.consumer_secret = twitter_keys["consumer_secret"]
end
