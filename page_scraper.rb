require 'httparty'

class Scraper
 
  include HTTParty
  
  def scrape
  
    scraped_data = []
	reddit_data = self.class.get("http://www.reddit.com/r/Kanye/.json")
	reddit_data["data"]["children"].each do |story|
	  scraped_data.push(story["data"]["url"].to_s)
      if story["data"].include? "preview"
	    scraped_data.push(story["data"]["preview"]["images"]["source"]["url"].to_s)
      end	  
	end
	
	puts scraped_data
	
  end
  
end

bot = Scraper.new
bot.scrape
