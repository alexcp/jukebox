require 'rails_helper'

RSpec.describe MusicProvider do
  before :each do
    canned_response = [{
      "downloadable"=>false,
      "label_id"=>nil,
      "purchase_title"=>nil,
      "genre"=>"Origami Sound",
      "title"=>"Borealis - Helical Flutter",
      "permalink_url"=>"http://soundcloud.com/origamisound/borealis-lover"
    }]
    allow_any_instance_of(SoundCloud::Client).to receive(:get).and_return(canned_response)
  end
  it "should return the tracks urls for a given artist" do
    expect(MusicProvider.instance.tracks_from_artist("borealis")).to eq(["http://soundcloud.com/origamisound/borealis-lover"])
  end
end
