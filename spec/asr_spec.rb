require_relative '../lib/scrapper'
require_relative '../lib/presenter'
require 'rspec'

describe 'PageScraper' do
  let(:main_scrapper) { Scrapper::PageScrapper.new }
  let(:present_results) { Presenter::OffersPresenter.new }

  describe '#page_scraper' do
    it 'It is not nil' do
      expect(main_scrapper.page_scrapper).not_to be_nil
    end
  end
end
