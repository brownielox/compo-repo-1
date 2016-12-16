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

    # doc.css(".odd").each do |locale|

      location_hash << {

          name: doc.css(".odd td:eq(0)").text,

          address: doc.css(".odd td:eq(1)").text,

          day: doc.css(".odd td:eq(2)").text,

          hours: doc.css(".odd td:eq(3)").text,

          borough: doc.css(".odd td:eq(4)").text,

        }

      # end
      puts location_hash[0]
end