class District
  attr_accessor :countryName, :lng, :fcodeName, :name, :fcode, :geonameId, :asciiName
  attr_accessor :lat, :population, :countryId, :fclName, :countryCode, :toponymName, :continentCode
  def initialize(hash)
    hash.each_pair do |k, v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
    end
  end
end


# hashing = {
#   :countryName => "Asia", 
#   :lng => "Goa", 
#   :fcodeName => "hindi", 
#   :name => 123456, 
#   :fcode=> 1.567,
#   :geonameId => 12, 
#   :asciiName => 45, 
#   :lat => 50,
#   :population => 10,
#   :countryId => 100,
#   :fclName => 50, 
#   :countryCode => 100, 
#   :toponymName => 80, 
#   :continentCode => "hey"
# }