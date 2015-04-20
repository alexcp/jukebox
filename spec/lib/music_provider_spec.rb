require 'rails_helper'

RSpec.describe MusicProvider do
  before :each do
    canned_response = [{
      "downloadable"=>false,
      "label_id"=>nil,
      "purchase_title"=>nil,
      "genre"=>"Origami Sound",
      "title"=>"Borealis - Helical Flutter",
      "embeddable_by"=>"all",
      "artwork_url"=>"http://image.png",
      "permalink_url"=>"http://soundcloud.com/origamisound/borealis-lover"
    }]
    allow_any_instance_of(SoundCloud::Client).to receive(:get).and_return(canned_response)
  end
  describe "#tracks_url" do
    it "should return the tracks urls for a given artist" do
      artist = Artist.new(name: "borealis")
      expect(MusicProvider.instance.track_from_artist(artist).url).to eq("http://soundcloud.com/origamisound/borealis-lover")
    end
  end
end
