class TweetGrabber

  attr_reader :api_key

  def initialize(api_key)
    @api_key = api_key
  end

  def self.create!
    config = YAML::load(File.open("config/twitter.yml","r"))
    TweetGrabber.new(config["api_key"])
  end
end