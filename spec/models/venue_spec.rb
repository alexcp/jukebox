require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe "validations" do
    let(:venue){ Venue.new(name: "new_venue") }
    it "should be true on valid models" do
       expect(venue).to be_valid
    end
    it "should require a name" do
      venue.name = ""
      expect(venue).to have_at_least(1).error_on(:name)
    end
    it "should have a unique name" do
      Venue.create(name: "test")
      venue.name = "test"
      expect( venue ).to have_at_least(1).error_on(:name)
    end
  end
end
