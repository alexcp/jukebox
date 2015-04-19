require 'rails_helper'

RSpec.describe ConcertParser do
  let(:concert_parser){ConcertParser.new(["", "MAKE A CHANGE", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"])}

  describe "#parse" do
    it "should create hash with concerts atributtes" do
      expect(ConcertParser.parse([["", "MAKE A CHANGE", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"]])).to have_at_least(1).concert_parser_instance
    end
  end

  describe "#parse_artist_name" do
    it "should retrieve the artist name" do
      expect(concert_parser.artist).to eq("make a change")
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
