require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it "should require a name" do
      expect( Artist.new ).to have_at_least(1).error_on(:name)
    end
    it "should have a unique name" do
      Artist.create(name: "test")
      expect( Artist.new(name: "test") ).to have_at_least(1).error_on(:name)
    end
  end
end
