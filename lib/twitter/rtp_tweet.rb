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
      hashtags:        t.hashtags,
      md5:             t.md5
    }
  end

  def full_text
    tweet_object.full_text
  end

  def created_at
    tweet_object.created_at
  end

  def hashtags
    tweet_object.hashtags.map {|hashtag_object|
      hashtag_object.text 
    }
  end

  def md5
    Digest::MD5.hexdigest(full_text)
  end
end