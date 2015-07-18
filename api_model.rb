require 'net/http'
require 'json'

class ApiCall
	attr_accessor :url, :query_type, :api_endpoint, :api_username
	attr_accessor :jsonfile, :my_hash

	@@api_endpoint = "http://api.geonames.org/"
	@@api_username = "username=valindo"

	def initialize( query_type, url )
		@query_type = query_type.to_s+"?"
		@url = URI.escape(parameter_converter(url)).to_s
	end

	def parameter_converter(parameters)
		string = ""
		parameters.each do |k,v|
			string = string + "#{k}=#{v}&" 
		end
		string
	end

	def api_json
		@url = URI( @@api_endpoint + @query_type + @url + @@api_username )
		@jsonfile = Net::HTTP.get(@url)
		@hash = JSON.parse(@jsonfile)
	end


end