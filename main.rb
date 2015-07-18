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
	api_object = ApiCall.new("findNearbyJSON",params)
	@my_hash = api_object.api_json
	erb :search
end

get '/places_around' do
	@title = "Places around | "+params[:name].to_s
	api_object = ApiCall.new("neighboursJSON",params)
	@my_hash = api_object.api_json
	erb :search
end

get '/places_in' do
	@title = "Places in | "+params[:name].to_s
	api_object = ApiCall.new("childrenJSON",params)
	@my_hash = api_object.api_json
	erb :search
end

# REVIEW -- badly structured. This URL shoud take a unique place identifier in
# the URL, make a separate call to fetch all the place details, and display
# them directly instead of depending upon the POST params.
get '/info' do
	api_object = ApiCall.new("getJSON",params)
	@info = api_object.api_json
	api_object = ApiCall.new("containsJSON",params)
	@my_hash = api_object.api_json
	erb :info
end


get '/test' do
	api_object = ApiCall.new("searchJSON",params)
	@my_hash = api_object.api_json
	erb :search
end