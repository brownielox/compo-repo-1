require_relative "../lib/location.rb"
require 'nokogiri'
require 'colorize'
require 'open-uri'
require 'pry'



BASE_PATH = "https://www.grownyc.org/compost/locations"

puts "Hello! Welcome to NYCompost"

  def talk

   puts "Please enter the borough or day of the week you'd like to drop off your compost. You can also say 'all' to see every location."
   input = gets.chomp

    doc = Nokogiri::HTML(open(BASE_PATH))

    locations_array = []

    doc.css(".odd").each do |locale|

    	  borough = locale.css("td")[0].text.to_s.strip

        name = locale.css("td a").text.to_s.strip

        address = locale.css("td")[1].text.to_s.gsub(name, "").strip

        days = locale.css("td")[2].text.to_s.gsub("Closed for the season.", "").strip

        hours = locale.css("td")[3].text.to_s.strip

        locations_array << Location.new(borough, name, days, hours, address)

    end

    locations_array.each do |locale|

  	 if input.downcase == locale.days.downcase || input.downcase + 's' == locale.days.downcase
   		locale.days_hours_info

      elsif input.downcase == locale.borough.downcase
      locale.borough_info

  	 	elsif input == locale.hours
  	 		locale.days_hours_info

      elsif input == "all"
        locale.days_hours_info
      end

     end

    puts "------------+------------"
    puts "Would you like more information? Y/n"
    answer = gets.chomp

    if answer.include?("Y") || answer.include?("y")
      talk

    else
      puts "Bye!"
    end
  end
talk
