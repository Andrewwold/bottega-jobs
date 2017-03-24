require 'net/http'
require 'JSON'

module Api
  class Github
    def self.get(title, location)
      uri = URI('https://jobs.github.com/positions.json')
      params = {:title => title, :location => location }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      parsed = JSON.parse(res.body)
      parsed if res.is_a?(Net::HTTPSuccess) 
    end

    def self.parse response
      response.each do |arr|
        JobPost.new(title: arr.title, location: arr.location)
      end
    end
  end
end
