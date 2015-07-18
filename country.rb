class Country
  attr_accessor :continent, :capital, :languages, :geonameId, :south
  attr_accessor :isoAlpha3, :north, :fipsCode, :population, :east
  attr_accessor :isoNumeric, :areaInSqKm, :countryCode, :west
  attr_accessor :countryName, :continentName, :currencyCode

  def initialize(hash)
    hash.each_pair do |k, v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
    end    
  end
end


# hashing = {
#   :continent => "Asia", 
#   :capital => "Goa", 
#   :languages => "hindi", 
#   :geonameId => 123456, 
#   :south=> 1.567,
#   :isoAlpha3 => 12, 
#   :north => 45, 
#   :fipsCode => 50,
#   :population => 10,
#   :east => 100,
#   :isoNumeric => 50, 
#   :areaInSqKm => 100, 
#   :countryCode => 80, 
#   :west => "hey",
#   :countryName =>20, 
#   :continentName => 80, 
#   :currencyCode => 50
# }

# test = CountryModel.new(hashing)