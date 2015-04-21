require 'rails_helper'

RSpec.describe ConcertParser do
  let(:default_data){["", "MAKE A CHANGE", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"]}
  let(:multiple_artists){["", "PAROXYSM + OBSOLETE MANKIND + ABITABYSS", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"]}
  let(:canceled_show){["", "HOOKWORMS**cancelled*** ", "03-Apr-15", "21:00", "Theatre Plaza", "$40.10"]}
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

  describe "#_artist_names" do
    it "should retrieve the artist name" do
      expect(concert_parser.artists).to eq(["make a change"])
    end

    it "should work with multiple artists seperated by '+'" do
      concert_parser = ConcertParser.new(multiple_artists)
      expect(concert_parser.artists).to eq(["paroxysm", "obsolete mankind", "abitabyss"])
    end

    it "should work with multiple artists seperated by ', '" do
      concert_parser = ConcertParser.new(
        ["", "PAROXYSM, OBSOLETE MANKIND, ABITABYSS", "03-Apr-15", "17:00", "Theatre Plaza", "$40.00"]
      )
      expect(concert_parser.artists).to eq(["paroxysm", "obsolete mankind", "abitabyss"])
    end
    
    describe "additionnal info in name" do
      let(:concert_parser){ConcertParser.new(canceled_show)}

      it "should detect and remove information" do
        expect(concert_parser.artists).to eq(["hookworms"])
      end
      it "should store the info in the additionnal info variable" do
        expect(concert_parser.additionnal_info).to eq("cancelled")
      end
    end
  end

  describe "#date" do
    it "should parse the date from the given string" do
      expect(concert_parser.date).to eq(Date.parse("03-04-2015"))
    end
  end

  describe "#time" do
    it "should parse the time from the given string" do
      expect(concert_parser.time).to eq("17:00")
    end
  end

  describe "#venue_name" do
    it "should retrieve the venue name" do
      expect(concert_parser.venue).to eq("theatre plaza")
    end
  end

  describe "#price" do
    it "should parse the price from a string" do
      expect(concert_parser.price).to eq(4000)
    end
  end
end
