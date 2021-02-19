require 'httparty'
require 'nokogiri'
require 'colorize'
require 'io/console'
require 'spinning_cursor'

module Scrapper
  class PageScrapper
    # scrape the whole page
    def self.page_scrapper
      Nokogiri::HTML(HTTParty.get('https://store.steampowered.com/').body)
    end

    private

    # parse the offers and announce loading while it's done
    def offers_parser
      SpinningCursor.run do
        message 'Done!'
      end
      parsed_offers = PageScrapper.page_scrapper.css('div#tab_specials_content a') # 40 deals
      SpinningCursor.stop
      parsed_offers
    end

    # put all the parsed offers in an array
    def offers_array_builder
      @deal_listings = offers_parser
      @deals = []
      i = 0
      while i <= 39
        @deal_listings.each do |deal_listing| # iterate through all listings and build a hash with data from each
          @deal = {
            title: deal_listing.css('div.tab_item_name').text,
            original_price: deal_listing.css('div.discount_original_price').text,
            discount: deal_listing.css('div.discount_pct').text,
            price: deal_listing.css('div.discount_final_price').text,
            url: @deal_listings.css('a')[i].attribute('href').value
          }

          @deals << @deal # put all deals into an array called deals.
          i += 1
        end
      end
      @deals[0..39] # return the first 40 array of deals
    end
  end
end
