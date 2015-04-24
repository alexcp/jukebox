require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    let(:artist){ Artist.new(name: "new_artist") }
    it "should be true on valid models" do
       expect(artist).to be_valid
    end
    it "should require a name" do
      artist.name = ""
      expect(artist).to have_at_least(1).error_on(:name)
    end
    it "should have a unique name" do
      Artist.create(name: "test")
      artist.name = "test"
      expect( artist ).to have_at_least(1).error_on(:name)
    end
  end

  describe "#find_similar" do
    let(:artist){artists(:mfdoom)}
    it "should return a list of similar artist" do
      expect(artist.find_similar).to be_a Array
    end
  end
end
