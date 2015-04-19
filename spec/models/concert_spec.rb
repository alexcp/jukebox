require 'rails_helper'

RSpec.describe Concert, type: :model do
  describe "validations" do
    let(:concert){ Concert.new(artist_id: 1, venue_id: 1, date: Date.today, time: Time.now, price: 10) }
    it "should be true on valid models" do
       expect(concert).to be_valid
    end
    it "should require an artist_id" do
      concert.artist_id = nil
      expect( concert ).to have_at_least(1).error_on(:artist_id)
    end
    it "should require a venue_id" do
      concert.venue_id = nil
      expect( concert ).to have_at_least(1).error_on(:venue_id)
    end
    it "should require a date" do
      concert.date = nil
      expect( concert ).to have_at_least(1).error_on(:date)
    end
    it "should require a time" do
      concert.time = nil
      expect( concert ).to have_at_least(1).error_on(:time)
    end
    it "should validates numericality of price" do
      concert.price = "test"
      expect( concert ).to have_at_least(1).error_on(:price)
    end
  end
end
