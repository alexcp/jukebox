require 'rails_helper'

RSpec.describe ArtistsHelper, type: :helper do
  let(:artist){artists(:mfdoom)}
  describe "#display_artists_link" do
    it "should display a link for each artist in the collection" do
      expect(helper.display_artists_link([artist])).to eq("<a href=\"/artists/1\">Mf Doom</a>")
    end
  end
end
