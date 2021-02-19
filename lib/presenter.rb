require_relative '../lib/scrapper'

module Presenter
  include Scrapper
  class OffersPresenter < Scrapper::PageScrapper
    # build the results list
    # include a 'printing_mode' argument to be able to test the method without printing everything on screen each time.
    def present_deals?(printing_mode: true)
      return nil if printing_mode == false

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
end
