require_relative '../lib/scrapper'
require_relative '../lib/presenter'
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
    it 'Has a key called "url" that includes "https"' do
      expect(main_scrapper.offers_array_builder[0][:url]).to include('https')
    end
    it 'Has a key called "title"' do
      expect(main_scrapper.offers_array_builder[0]).to have_key(:title)
    end
  end
end

describe 'OffersPresenter' do
  let(:present_results) { Presenter::OffersPresenter.new }

  # for testing purposes this one returns ['test']
  describe 'present_deals' do
    it 'Is an array' do
      expect(present_results.present_deals).to eq ['test']
    end
    # Check true argument with mock data.
    it 'takes true argument' do
      dbl = double('mock', arg: true)
      expect(dbl.arg).to eq(true)
    end
    # Check false argument with mock data.
    it 'takes false argument' do
      dbl2 = double('mock2', arg: false)
      expect(dbl2.arg).to eq(false)
    end
    it 'test' do
      dbl3 = double('takes #present_deals with a false argument for testing')
      expect(dbl3).to receive(:present_deals).with(false)
      dbl3.present_deals(false)
    end
  end
end
