require 'core'

class RTPScraper::Tweet

  attr_reader :tweet_object

  def initialize(tweet_object)
    @tweet_object = tweet_object
  end

  def self.return_contents!(tweet_object)
    t = RTPScraper::Tweet.new(tweet_object)
    { 
      text_to_display: t.full_text,
      created_at:      t.created_at,
      hashtags:        t.hashtags
    }
  end

  def full_text
    tweet_object.full_text
  end

  def created_at
    tweet_object.created_at
  end

  def hashtags
    tweet_object.hashtags
  end
end