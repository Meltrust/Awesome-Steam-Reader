require_relative '../lib/scraper'

# scrap = ScrapePage::MainScraper.new
# p scrap.scraper

describe 'MainScraper' do
  let(:main_scraper) { ScrapePage::MainScraper.new }

  describe '#scraper' do
    it 'Returns 40 elements' do
      expect(main_scraper.scraper.length).to eq(40)
    end

    it 'Returns an array' do
      expect(main_scraper.scraper).to be_an_instance_of Array
    end

    it 'It is not nil' do
      expect(main_scraper.scraper[0]).not_to be_nil
    end
    it 'Has a key called "title"' do
      expect(main_scraper.scraper[0]).to have_key(:title)
    end
    it 'Has a key called "url" that includes "https"' do
      expect(main_scraper.scraper[0][:url]).to include('https')
    end
    it 'It is not empty' do
      expect(main_scraper.scraper).not_to be_empty
    end
  end

  describe '#results' do
    it 'Is not empty' do
      expect(main_scraper.results).not_to be_empty
    end
    it 'It is not nil' do
      expect(main_scraper.results).not_to be_nil
    end
    it 'Is an Array' do
      expect(main_scraper.results).to be_an_instance_of Array
    end
    it 'Has 40 elements' do
      expect(main_scraper.results.length).to eq(40)
    end
    it 'Number of elements divisible by 10' do
      expect(main_scraper.results.length).to(satisfy { |x| x % 10 == 0 })
    end
  end
end
