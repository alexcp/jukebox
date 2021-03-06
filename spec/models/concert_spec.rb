require 'rails_helper'

RSpec.describe Concert, type: :model do
  describe "validations" do
    let(:concert){ Concert.new(artists: [Artist.new(name: "test")], venue: Venue.new(name: "test"), date: Date.today, time: Time.now, price: 10) }
    it "should be true on valid models" do
       expect(concert).to be_valid
    end
    it "should require an artist" do
      concert.artists = []
      expect( concert ).to have_at_least(1).error_on(:artists)
    end
    it "should require a venue" do
      concert.venue = nil
      expect( concert ).to have_at_least(1).error_on(:venue)
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

    it "should be a unique combination" do
      new_concert = Concert.new(concert.attributes.except([:id,:created_at,:updated_at]))
      expect(new_concert.valid?).to be_falsy
    end
  end
end
