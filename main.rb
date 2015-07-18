require 'net/http'
require './api_model.rb'


get '/' do
	@title = "Home"
	api_object = ApiCall.new("countryInfoJSON",{"style" => "full"})
	@country_array = api_object.api_country
	erb :country
end

get '/in/state' do
	api_object = ApiCall.new("childrenJSON",params)
	@state_array = api_object.api_state
	erb :state
end

get '/in/district' do
	api_object = ApiCall.new("childrenJSON",params)
	@district_array = api_object.api_district
	erb :district
end

get '/in/city' do
	api_object = ApiCall.new("childrenJSON",params)
	@city_array = api_object.api_city
	erb :city
end


get '/in/child' do
	api_object = ApiCall.new("childrenJSON",params)
	@child_array = api_object.api_child
	erb :childrens
end

# get '/search' do
# 	@title = "Search | "+params[:name].to_s
# 	api_object = ApiCall.new("searchJSON",params)
# 	@my_hash = api_object.api_json
# 	erb :search
# end
# # REVIEW -- implement pagination. 10 at a time.

# get '/type_code_search' do
# 	@title = "Type search | "+params[:fcode].to_s
# 	api_object = ApiCall.new("findNearbyJSON",params)
# 	@my_hash = api_object.api_json
# 	erb :search
# end

# get '/places_around' do
# 	@title = "Places around | "+params[:name].to_s
# 	api_object = ApiCall.new("neighboursJSON",params)
# 	@my_hash = api_object.api_json
# 	erb :search
# end

# get '/places_in' do
# 	@title = "Places in | "+params[:name].to_s
# 	api_object = ApiCall.new("childrenJSON",params)
# 	@my_hash = api_object.api_json
# 	erb :search
# end

# # REVIEW -- badly structured. This URL shoud take a unique place identifier in
# # the URL, make a separate call to fetch all the place details, and display
# # them directly instead of depending upon the POST params.
# get '/info' do
# 	api_object = ApiCall.new("getJSON",params)
# 	@info = api_object.api_json
# 	api_object = ApiCall.new("containsJSON",params)
# 	@my_hash = api_object.api_json
# 	erb :info
# end