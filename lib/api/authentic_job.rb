require 'net/https'
module Api
	module AuthenticJob

		def get
			uri = URI('https://authenticjobs.com/api/')
			params = { :limit => 10, :page => 3 }
			uri.query = URI.encode_www_form(params)

			res = Net::HTTP.get_response(uri)
			puts res.body if res.is_a?(Net::HTTPSuccess)
		end
	end
end