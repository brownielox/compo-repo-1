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

  def borough_info
    puts "------------+------------"
    puts @borough
    puts @name
    puts @address
    puts @days
    puts @hours
  end

  def days_hours_info
    puts "------------+------------"
    puts @borough
    puts @name
    puts @address
    puts @days
    puts @hours
  end

end