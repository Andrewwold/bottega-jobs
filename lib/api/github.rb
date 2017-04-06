require 'net/http'
require 'JSON'

module Api
  class Github
    def self.get(title="developer")
      uri = URI('https://jobs.github.com/positions.json')
      params = {:title => title }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      parsed = JSON.parse(res.body)
      parsed if res.is_a?(Net::HTTPSuccess) 
    end

    def self.parse response
      response.each do |arr|
        j = JobPost.find_or_initialize_by(api_id: arr['id'], api_name: 'github')
        j.update_attributes({:title => arr['title'], :location => arr['location'], :company => arr['company'], :description => arr['description'], :additional_description => arr['how_to_apply'], :additional_title => "HOW TO APPLY", :job_type => arr["type"] })
      end
    end
  end
end
