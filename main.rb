require 'net/http'
require './api_model.rb'

get '/' do
	@title = "Home"
	erb :index
end

get '/search' do
	@title = "Search | "+params[:name].to_s
	api_object = ApiCall.new("searchJSON",params)
	@my_hash = api_object.api_json
	erb :search
end
# REVIEW -- implement pagination. 10 at a time.

get '/type_code_search' do
	@title = "Type search | "+params[:fcode].to_s
	lat = params[:lat]
	lng = params[:lng]
	fcode = params[:fcode]
	uri = URI('http://api.geonames.org/findNearbyJSON?lng='+lng+'&lat='+lat+'&featureCode='+fcode+'&radius=100&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

get '/places_around' do
	@title = "Places around | "+params[:name].to_s
	geoid = params[:geonameId]
	uri = URI('http://api.geonames.org/neighboursJSON?geonameId='+geoid+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

get '/places_in' do
	@title = "Places in | "+params[:name].to_s
	geoid = params[:geonameId]
	uri = URI('http://api.geonames.org/childrenJSON?geonameId='+geoid+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

# REVIEW -- badly structured. This URL shoud take a unique place identifier in
# the URL, make a separate call to fetch all the place details, and display
# them directly instead of depending upon the POST params.
get '/info' do
	geonameId = params[:geonameId]
	uri = URI('http://api.geonames.org/getJSON?geonameId='+geonameId+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@info = JSON.parse(jsonfile)
	uri = URI('http://api.geonames.org/containsJSON?geonameId='+geonameId+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :info
end


get '/test' do
	api_object = ApiCall.new("searchJSON",params)
	@my_hash = api_object.api_json
	erb :search
end