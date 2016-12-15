require_relative "../compo-repo/scraper.rb"
require_relative "../compo-repo/location.rb"
require 'nokogiri'
require 'colorize'
require 'open-uri'
require 'pry'

class CommandLineInteface
  BASE_PATH = "https://www.grownyc.org/compost/locations"


   puts "Where would you like to compost?"
   gets.strip.chomp

   page_arr = Scraper.new.scrape_webpage(BASE_PATH)

end
