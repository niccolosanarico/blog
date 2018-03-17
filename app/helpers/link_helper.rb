require 'faraday'
require 'faraday_middleware'
require 'json'

module LinkHelper

  def shorten_url_coinhive(link)
    coinHiveAPI = Faraday.new(:url => 'https://api.coinhive.com/') do |faraday|
      faraday.request  :url_encoded                     # form-encode POST params
      faraday.response :logger                    # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    begin
      clink = coinHiveAPI.post do |req|
        req.url 'link/create'
        req.body = { secret: "WmpNlqOEoDXCPDybCQmzI9TltMFe7V8U", url: "#{link}", hashes: 256 }
      end
    rescue Exception => e
      puts e
    end

    return JSON.parse(clink.body)["url"]
  end
end
