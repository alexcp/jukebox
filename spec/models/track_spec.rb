require 'rails_helper'

RSpec.describe Track, type: :model do
  let(:artist){artists(:mfdoom)}
  describe "#new_track_for_artist" do
    it "should initialize a new track for the given artist" do
      allow(MusicProvider).to receive(:track_for_artist).and_return(Track.new(url: "ok", embed_code: "<iframe></iframe>"))
      expect(Track.new_track_for_artist(artist.id)).to be_a Track
    end
    it "should handle case where MusicProvider can't find a track" do
      allow(MusicProvider).to receive(:track_for_artist).and_return(nil)
      expect(Track.new_track_for_artist(artist.id)).to be_falsy
    end
  end
end
