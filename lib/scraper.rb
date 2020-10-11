require 'httparty'
require 'nokogiri'
require 'byebug'
require 'awesome_print'

def scraper
  parsed_page = Nokogiri::HTML(HTTParty.get('https://store.steampowered.com/'))
  deals = []

  deal_listings = parsed_page.css('div#tab_specials_content a') # 40 deals

  i = 0
  while i <= 39
    deal_listings.each do |deal_listing| # iterate through all listings and build a hash with data from each
      deal = {
        title: deal_listing.css('div.tab_item_name').text,
        discount: deal_listing.css('div.discount_pct').text,
        price: deal_listing.css('div.discount_final_price').text,
        url: deal_listings.css('a')[i].attribute('href').value
      }

      deals << deal # put all jobs into an array called deals.
      i += 1
    end
  end
  deals[0..39] # return the array of deals
end
