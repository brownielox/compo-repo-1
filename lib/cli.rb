require_relative "../lib/location.rb"
require 'nokogiri'
require 'colorize'
require 'open-uri'
require 'pry'

class CommandLineInteface
  BASE_PATH = "https://www.grownyc.org/compost/locations"


   puts "Where would you like to compost?"
   gets.strip.chomp

   # page_arr = self.new.scrape_webpage(BASE_PATH)

  # puts page_arr
 

    doc = Nokogiri::HTML(open(BASE_PATH))

    location_hash = []

    doc.css(".odd").each do |locale|

      location_hash << {

          name: locale.css(".odd:nth-child(0)").text,

          # address: locale.css(".odd:nth-child(1)").text,

          # day: locale.css(".odd:nth-child(2)").text,

          # hours: locale.css(".odd:nth-child(3)").text,

          # borough: locale.css(".odd:nth-child(4)").text,

        }
      end
    puts location_array[1]
end