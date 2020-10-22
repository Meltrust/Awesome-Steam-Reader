require 'httparty'
require 'nokogiri'
require 'colorize'
require 'io/console'

module ScrapePage
  class MainScraper
    def scraper
      parsed_page = Nokogiri::HTML(HTTParty.get('https://store.steampowered.com/'))
      deals = []

      deal_listings = parsed_page.css('div#tab_specials_content a') # 40 deals

      i = 0
      while i <= 39
        deal_listings.each do |deal_listing| # iterate through all listings and build a hash with data from each
          deal = {
            title: deal_listing.css('div.tab_item_name').text,
            original_price: deal_listing.css('div.discount_original_price').text,
            discount: deal_listing.css('div.discount_pct').text,
            price: deal_listing.css('div.discount_final_price').text,
            url: deal_listings.css('a')[i].attribute('href').value
          }

          deals << deal # put all deals into an array called deals.
          i += 1
        end
      end
      deals[0..39] # return the first 40 array of deals
    end

    def results
      count = 0
      scraper.each do |h|
        puts "#{count + 1}. " + h[:title].yellow.bold
        puts h[:original_price].blue
        puts h[:discount].green.bold
        puts h[:price].green.bold
        puts h[:url]
        puts
        count += 1
        next unless (count % 5).zero?

        puts
        puts 'Press any key to continue...' unless count == 40
        $stdin.getch
        puts
      end
    end
  end
end
