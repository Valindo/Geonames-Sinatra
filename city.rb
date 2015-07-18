class City
	attr_accessor :asciiName, :countryId, :fcl, :countryCode, :lat, :fcode
	attr_accessor :continentCode, :lng, :geonameId, :toponymName, :population
	attr_accessor :name, :fclName, :countryName, :fcodeName
	def initialize(hash)
		hash.each_pair do |k, v|
			self.send("#{k}=",v) if self.respond_to?("#{k}=")
		end
	end
end


# hashing = {
#   :asciiName => "Asia", 
#   :countryId => "Goa", 
#   :fcl => "hindi", 
#   :countryCode => 123456, 
#   :lat=> 1.567,
#   :fcode => 12, 
#   :continentCode => 45, 
#   :lng => 50,
#   :geonameId => 10,
#   :toponymName => 100,
#   :population => 50, 
#   :name => 100, 
#   :fclName => 80, 
#   :countryName => "hey",
#   :fcodeName => 123
# }