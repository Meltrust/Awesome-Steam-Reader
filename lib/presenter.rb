require_relative '../lib/scraper'

class Presenter < ScrapePage::ScrapeOffers
  include ScrapePage

  def present_deals
    @count = 0

    offers_array_builder.each do |h|
      puts "#{@count + 1}. " + h[:title].yellow.bold
      puts h[:original_price].blue
      puts h[:discount].green.bold
      puts h[:price].green.bold
      puts h[:url]
      puts
      @count += 1
      next unless (@count % 5).zero?

      puts
      puts 'Press any key to continue...' unless @count == 40

      $stdin.getch unless @count == 40
      puts
    end
  end
end
