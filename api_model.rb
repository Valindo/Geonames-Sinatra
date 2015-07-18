require 'net/http'
require 'json'
require "./country.rb"
require "./state.rb"
require "./district.rb"
require "./city.rb"

class ApiCall
	attr_accessor :url, :query_type, :api_endpoint, :api_username
	attr_accessor :jsonfile, :my_hash, :array

	@@api_endpoint = "http://api.geonames.org/"
	@@api_username = "username=valindo"

	def initialize( query_type, url )
		@query_type = query_type.to_s+"?"
		@url = URI.escape(parameter_converter(url)).to_s
		@array = []
	end

	def parameter_converter(parameters)
		string = ""
		parameters.each do |k,v|
			string = string + "#{k}=#{v}&" 
		end
		string
	end

	def api_country
		@url = URI( @@api_endpoint + @query_type + @url + @@api_username )
		@jsonfile = Net::HTTP.get(@url)
		@hash = JSON.parse(@jsonfile)
		@hash["geonames"].each do |x|
			object = Country.new(x)
			array << object
		end
		array
	end

	def api_state
		@url = URI( @@api_endpoint + @query_type + @url + @@api_username )
		@jsonfile = Net::HTTP.get(@url)
		@hash = JSON.parse(@jsonfile)
		@hash["geonames"].each do |x|
			object = State.new(x)
			array << object
		end
		array
	end

	def api_district
		@url = URI( @@api_endpoint + @query_type + @url + @@api_username )
		@jsonfile = Net::HTTP.get(@url)
		@hash = JSON.parse(@jsonfile)
		@hash["geonames"].each do |x|
			object = District.new(x)
			array << object
		end
		array
	end

	def api_city
		@url = URI( @@api_endpoint + @query_type + @url + @@api_username )
		@jsonfile = Net::HTTP.get(@url)
		@hash = JSON.parse(@jsonfile)
		@hash["geonames"].each do |x|
			object = City.new(x)
			array << object
		end
		array
	end


end