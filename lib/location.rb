class Location
  attr_accessor :name, :address, :hours, :days, :borough

  @@all = []

    def initialize(borough=nil, name=nil, days=nil, hours=nil, address=nil)
      @borough = borough
      @name = name
      @days = days
      @hours = hours
      @address = address
      @@all << self
    end

  def showall
    @@all
  end

end