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
      text_created_at: t.created_at,
      tags:            t.tags,
      md5:             t.md5,
      source:          "Twitter"
    }
  end

  def full_text
    tweet_object.full_text
  end

  def created_at
    tweet_object.created_at
  end

  def tags
    tweet_object.hashtags.map {|hashtag_object|
      hashtag_object.text 
    }
  end

  def md5
    Digest::MD5.hexdigest(full_text)
  end
end