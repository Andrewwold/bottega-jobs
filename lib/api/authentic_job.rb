require 'net/https'
module Api
	module AuthenticJob

		def self.get
			uri = URI('https://authenticjobs.com/api/')
			params = { :limit => 10, :page => 3, format: 'json', api_key: '83485a746390c45a90c9646cfe72f881', method: 'aj.jobs.search' }
			uri.query = URI.encode_www_form(params)

			res = Net::HTTP.get_response(uri)
			res.body if res.is_a?(Net::HTTPSuccess)
		end
	end
end

# [
# 	{title: 'title1', description: 'description1'},
# 	{title: 'title1', description: 'description1'}
# 	{title: 'title1', description: 'description1'}
# 	{title: 'title1', description: 'description1'}
# 	{title: 'title1', description: 'description1'}
# ]

