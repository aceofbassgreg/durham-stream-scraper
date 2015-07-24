require 'core'
require 'durham_twitter'

class DurhamScraper::Onboarder

  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def process_payload
    payload.map {  |obj|
      klass = durhamscraper_klass(obj.class)
      klass.return_contents!(obj)
    }
  end

  def demodulize(klass)
    klass.to_s.split('::').last
  end

  def durhamscraper_klass(klass)
    str = "DurhamScraper::" + demodulize(klass)
    Object.const_get(str)
  end


end