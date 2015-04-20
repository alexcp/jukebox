require 'rails_helper'

RSpec.describe ConcertsHelper, type: :helper do
  describe "#display_price" do
    it "should properly format the price" do
      expect(helper.display_price(2000)).to eq("$20.00")
    end
    it "should handle cents properly" do
      expect(helper.display_price(2041)).to eq("$20.41")
    end
  end
end
