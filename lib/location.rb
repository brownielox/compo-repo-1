class CompostLocation
  attr_accessor :name, :address, :hours, :day, :borough

  @@all = []

    def initialize(location_info)
      @name = location_info[:name]
      @address = location_info[:location]
      @day = location_info[:day]
      @hours = location_info[:profile_url]
      @borough = location_info[:borough]
      @@all << self
    end

end