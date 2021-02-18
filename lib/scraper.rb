require 'httparty'
require 'nokogiri'
require 'colorize'
require 'io/console'
require 'spinning_cursor'

module ScrapePage
  class ScrapeOffers
    private

    def offers_scraper
      SpinningCursor.run do
        message 'Done!'
      end
      @parsed_page = Nokogiri::HTML(HTTParty.get('https://store.steampowered.com/').body)
      SpinningCursor.stop
      @parsed_page.css('div#tab_specials_content a') # 40 deals
    end

    def offers_array_builder
      @deal_listings = offers_scraper
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
