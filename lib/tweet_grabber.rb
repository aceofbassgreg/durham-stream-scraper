require_relative '../config/twitter_client'


class TweetGrabber

  attr_reader :client

  def initialize(client)
    @client = client
  end

  def self.create!
    TweetGrabber.new(Client)
  end

  
end