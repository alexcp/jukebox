require 'rails_helper'

RSpec.describe ConcertListingScraper do
  let(:concert_listing){ConcertListingScraper.new("file:///#{File.dirname(__FILE__)}/cheap_thrills_news.html")}
  describe "#to_a" do
    it "should display an array with concert information" do
      expect(concert_listing.to_a).to be_an Array
    end
    it "should contain all the elements on the page" do
      expect(concert_listing.to_a.count).to eq(53)
    end
  end
end
