class Child
  attr_accessor :countryName, :lng, :fcodeName, :name, :fcode, :geonameId, :asciiName, :fcl
  attr_accessor :lat, :population, :countryId, :fclName, :countryCode, :toponymName, :continentCode
  def initialize(hash)
    hash.each_pair do |k, v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
    end
  end
end
