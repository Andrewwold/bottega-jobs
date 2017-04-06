require 'net/https'
module Api
    module AuthenticJob
        def self.get(custom_params = {})
           uri = URI("https://authenticjobs.com/api")
            params = { api_key: "83485a746390c45a90c9646cfe72f881", method: "aj.jobs.search", format: "json", perpage: '100'}.merge(custom_params)
            uri.query = URI.encode_www_form(params)
            res = Net::HTTP.get_response(uri)
            res.body if res.is_a?(Net::HTTPSuccess)
            JSON.parse(res.body)
        end
        def self.parse(raw_data)
            mapping = {full_time: 0, part_time: 1, internship:2, apprenticeship:3}
            parsed_data = []
            raw_data["listings"]["listing"].each do |listing|
                individual_listing = {}
                individual_listing[:title] = listing['title']
                individual_listing[:description] = listing['description']
                individual_listing[:api_name] = "authentic_job"
                individual_listing[:api_id] = listing['id']
                individual_listing[:job_type] = mapping[listing['type']['name'].downcase.gsub('-', '_')] || nil

                
                if listing['company']
                    individual_listing[:company] = listing['company']['name']
                    individual_listing[:location] = "#{listing['company']['location']['city']}, #{listing['company']['location']['state']}" if listing['company']['location']
                end
                parsed_data << individual_listing
            end
            parsed_data
        end
    end
end
