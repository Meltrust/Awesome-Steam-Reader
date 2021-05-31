require 'httparty'
require 'nokogiri'
require 'spinning_cursor'
require 'io/console'

module Scrapper
  class PageScrapper
    # scrape the whole page
    def self.page_scrapper
      Nokogiri::HTML(HTTParty.get('https://store.steampowered.com/').body)
    end

    private

    # parse the offers and announce loading while it's done
    def offers_parser
      SpinningCursor.run { message 'Done!' }

      parsed_offers = PageScrapper.page_scrapper.css('div#tab_specials_content a') # 40 deals
      SpinningCursor.stop
      parsed_offers
    end
  end
end
