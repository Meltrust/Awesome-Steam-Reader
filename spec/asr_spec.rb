require_relative '../lib/scrapper'
require_relative '../lib/array_builders'
require 'rspec'

describe 'PageScraper' do
  let(:main_scrapper) { Scrapper::PageScrapper.new }

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

  describe 'OffersBuilder' do
    let(:build_results) { ArrayBuilders::OffersBuilder.new }

    describe '#offers_array_builder' do
      it 'Is not nil' do
        expect(build_results.offers_array_builder).not_to be_nil
      end
      it 'Returns objects' do
        expect(build_results.offers_array_builder).to be_a Object
      end
      it 'Returns an array' do
        expect(build_results.offers_array_builder).to be_an Array
      end
      it 'Has 40 elements' do
        expect(build_results.offers_array_builder.size).to eq(40)
      end
      it 'Has a key called "url" that includes "https"' do
        expect(build_results.offers_array_builder[0][:url]).to include('https')
      end
      it 'Has a key called "title"' do
        expect(build_results.offers_array_builder[0]).to have_key(:title)
      end
    end
  end
end
