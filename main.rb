require 'sinatra'
require 'net/http'
require 'json'


get '/' do
	@a=10
	erb :index
end

post '/search' do
	data = params[:name]
	data.gsub!(/\s/,"+")
	uri = URI('http://api.geonames.org/searchJSON?q='+data+'&maxRows=10&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end


get '/find/:name' do
	data = params[:name]
	uri = URI('http://api.geonames.org/searchJSON?name='+data+'&maxRows=10&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

post '/check_nearby/:lat/:lng/:fcode' do
	lat = params[:lat]
	lng = params[:lng]
	fcode = params[:fcode]
	uri = URI('http://api.geonames.org/findNearbyJSON?lng='+lng+'&lat='+lat+'&featureCode='+fcode+'&radius=100&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

get '/neighbours/:geonameid' do
	geoid = params[:geonameid]
	uri = URI('http://api.geonames.org/neighboursJSON?geonameId='+geoid+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end

get '/children/:geoname' do
	geoid = params[:geoname]
	uri = URI('http://api.geonames.org/childrenJSON?geonameId='+geoid+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :search
end


get '/contains/:geonameid' do
	geoid = params[:geonameid]
	uri = URI('http://api.geonames.org/containsJSON?geonameId='+geoid+'&username=valindo')
	jsonfile = Net::HTTP.get(uri)
	@my_hash = JSON.parse(jsonfile)
	erb :contains
end



get '/testing/:test' do
	test = params[:test]
	redirect to('/test1?test='+test)
end

post '/test1' do
	"#{params[:test]}"
end

