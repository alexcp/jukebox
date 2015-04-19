require 'rails_helper'

RSpec.describe ConcertParser do
  let(:default_data){["", "MAKE A CHANGE", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"]}
  let(:multiple_artists){["", "PAROXYSM + OBSOLETE MANKIND + ABITABYSS", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"]}
  let(:concert_parser){ConcertParser.new(default_data)}

  describe "class methods" do
    describe "#parse" do
      it "should create hash with concerts atributtes" do
        expect(ConcertParser.parse([default_data])).to have_at_least(1).concert_parser_instance
      end
    end
    describe "#save_all" do
      it "should save all the records to the database" do
        expect(ConcertParser.save_all([default_data, multiple_artists])).to be_truthy
        expect(Artist.find_by(name: "make a change").concerts).to have(1).concert
      end
    end
  end

  describe "#save" do
    it "should save the records to the data" do
      expect(concert_parser.save).to be_truthy
    end
  end

  describe "#parse_artist_names" do
    it "should retrieve the artist name" do
      expect(concert_parser.artists).to eq(["make a change"])
    end

    it "should work with multiple artists" do
      concert_parser = ConcertParser.new(multiple_artists)
      expect(concert_parser.artists).to eq(["paroxysm", "obsolete mankind", "abitabyss"])
    end
  end

  describe "#parse_date" do
    it "should parse the date from the given string" do
      expect(concert_parser.date).to eq(Date.parse("03-04-2015"))
    end
  end

  describe "#parse_time" do
    it "should parse the time from the given string" do
      expect(concert_parser.time).to eq(Time.parse("17:00"))
    end
  end

  describe "#parse_venue_name" do
    it "should retrieve the venue name" do
      expect(concert_parser.venue).to eq("theatre plaza")
    end
  end

  describe "#parse_price" do
    it "should parse the price from a string" do
      expect(concert_parser.price).to eq(4000)
    end
  end
end
