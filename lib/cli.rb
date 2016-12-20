require_relative "../lib/location.rb"
require 'nokogiri'
require 'colorize'
require 'open-uri'
require 'pry'

class CommandLineInteface
  BASE_PATH = "https://www.grownyc.org/compost/locations"

   puts "Hello! Please enter the borough in which you'd like to compost, or the day of the week you'd like to compost."
   input = gets.chomp

    doc = Nokogiri::HTML(open(BASE_PATH))

    locations_array = []

    temp = "
			"
 
    doc.css(".odd").each do |locale|

    	borough = locale.css("td")[0].text.to_s

        name = locale.css("td")[1].text.to_s.split(temp)[0]

        address = locale.css("td")[1].text.to_s.split(temp)[1]

        days = locale.css("td")[2].text.to_s.delete(temp)

        hours = locale.css("td")[3].text.to_s.delete(temp)

        locations_array << Location.new(borough, name, days, hours, address)

    end

        locations_array.each do |locale|

		 if input == locale.borough
	 		locale.borough_info

		 elsif input + "s" == locale.days
	 		locale.days_hours_info.strip

	 	elsif input == locale.hours
	 		locale.days_hours_info.strip
		 end
  	 end

end
