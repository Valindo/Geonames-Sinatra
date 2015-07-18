#DONE ----- # REVIEW -- use a Gemfile along with rvm or bundle to manage all your app
# dependencies.
# require 'sinatra'
require 'net/http'
# require 'json'


get '/' do
	@title = "Home"
	erb :index
end

# REVIEW -- why are these POST calls in the first place?
post '/search' do
	@title = "Search | "+params[:name].to_s
	data = params[:name]

	# REVIEW -- use a URI lirbary to encode your URLs. the following code takes
	# care of only one case, space characters. There are a lot of special cases
	# in URLs.
	data.gsub!(/\s/,"+")
	uri = URI('http://api.geonames.org/searchJSON?q='+data+'&fuzzy=0&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end


# REVIEW -- implement pagination. 10 at a time.
get '/find/:name' do
	data = params[:name]
	uri = URI('http://api.geonames.org/searchJSON?name='+data+'&maxRows=10&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

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
