require_relative '../lib/scrapper'
require_relative '../lib/presenter'
require 'rspec'

describe 'PageScraper' do
  let(:main_scrapper) { Scrapper::PageScrapper.new }
  # let(:present_results) { Presenter::OffersPresenter.new }

  describe '#page_scraper' do
    it 'Does not return nil' do
      expect(Scrapper::PageScrapper.page_scrapper).not_to be_nil
    end
    it 'Is not an array' do
      expect(Scrapper::PageScrapper.page_scrapper).not_to be_an_instance_of Array
    end
    it 'Is a not string' do
      expect(Scrapper::PageScrapper.page_scrapper).not_to be_an_instance_of String
    end
  end

  describe '#offers_parser' do
    it 'Does not return nil' do
      expect(main_scrapper.send(:offers_parser)).not_to be_nil
    end
    it 'Returns objects' do
      expect(main_scrapper.send(:offers_parser)[0]).to be_a Object
    end
  end

  describe '#offers_array_builder' do
    it 'Is not nil' do
      expect(main_scrapper.offers_array_builder).not_to be_nil
    end
    it 'Returns objects' do
      expect(main_scrapper.offers_array_builder).to be_a Object
    end
    it 'Returns an array' do
      expect(main_scrapper.offers_array_builder).to be_an Array
    end
    it 'Has 40 elements' do
      expect(main_scrapper.offers_array_builder.size).to eq(40)
    end
  end
end
