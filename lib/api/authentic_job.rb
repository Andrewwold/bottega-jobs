require 'net/https'
module Api
    module AuthenticJob
        def self.get(custom_params = {})
           uri = URI("https://authenticjobs.com/api")
            params = { api_key: "83485a746390c45a90c9646cfe72f881", method: "aj.jobs.search", format: "json"}.merge(custom_params)
            uri.query = URI.encode_www_form(params)
            res = Net::HTTP.get_response(uri)
            res.body if res.is_a?(Net::HTTPSuccess)
            JSON.parse(res.body)
        end
        def self.parse(raw_data)
            parsed_data = []
            raw_data["listings"]["listing"].each do |listing|
                individual_listing = {}
                 individual_listing[:title] = listing['title']
                 individual_listing[:description] = listing['description']
                parsed_data << individual_listing
            end
            parsed_data
        end
    end
end