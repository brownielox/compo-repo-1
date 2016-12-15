require_relative "../lib/location.rb"
require 'nokogiri'
require 'colorize'
require 'open-uri'
require 'pry'

class CommandLineInteface
  BASE_PATH = "https://www.grownyc.org/compost/locations"


  def self.scrape_webpage(index_url)

    doc = Nokogiri::HTML(open("https://www.grownyc.org/compost/locations"))

    location_array = []

    doc.css("").each do |locale|

      location_array << {

          name: locale.css(".odd:nth-child(0)").text,

          address: locale.css(".odd:nth-child(1)").text,

          day: locale.css(".odd:nth-child(2)").text,

          hours: locale.css(".odd:nth-child(3)").text,

          borough: locale.css(".odd:nth-child(4)").text,

        }
      end
    location_array
  end

  def chat

   puts "Where would you like to compost?"
   gets.strip.chomp

   page_arr = self.new.scrape_webpage(BASE_PATH)

  end
  # puts page_arr
end

chat
