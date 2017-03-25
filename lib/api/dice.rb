require 'net/http'
require 'JSON'

module Api
  class Dice
    def self.get(text, zip)
      uri = URI("http://service.dice.com/api/rest/jobsearch/v1/simple.json")
      params = {:text => text, :city => zip, :sort => "1" }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      parsed = JSON.parse(res.body)["resultItemList"]
      parsed if res.is_a?(Net::HTTPSuccess)
    end

    def self.parse jobs
      jobs.each do |job|
        JobPost.create(title: job["jobTitle"], city: job["location"])
      end
    end
  end
end
