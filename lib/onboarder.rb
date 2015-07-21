require 'core'
require 'rtp_twitter'

class RTPScraper::Onboarder

  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def process_payload
    payload.map {  |obj|
      klass = rtpscraper_klass(obj.class)
      klass.return_contents!(obj)
    }
  end

  def demodulize(klass)
    klass.to_s.split('::').last
  end

  def rtpscraper_klass(klass)
    str = "RTPScraper::" + demodulize(klass)
    Object.const_get(str)
  end


end