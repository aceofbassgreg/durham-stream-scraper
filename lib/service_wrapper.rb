require 'core'
require 'yaml'

class DurhamScraper::ServiceWrapper

  attr_reader :service_url

  def initialize
    @service_url = YAML::load(File.open("config/services.yml"))[ENV["ENV"]]
  end

  def upload_to_api(data)
    data.map {|entry|
      post_to_api(entry.to_json)
    }
  end

  def post_to_api(json)
    uri = URI.parse(service_url + "/entries")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, 
    initheader = {'Content-Type' =>'application/json'})
    request.body = json
    resp = http.request(request)
  end

end