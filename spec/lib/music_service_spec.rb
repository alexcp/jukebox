require "rails_helper"

describe MusicService do
  let(:artist){artists(:mfdoom)}
  before :each do 
    similar_artist = [ "MF DOOM",
      {"name"=>"Viktor Vaughn",
       "url"=>"www.last.fm/music/Viktor+Vaughn",
       "image"=> [],
       "streamable"=>"0"
    }]
    mock_response = instance_double("artists", get_similar: similar_artist)
    allow_any_instance_of(Lastfm).to receive(:artist).and_return(mock_response)
  end

  describe "#find_similar_artists" do
    it "should return a list of similar artist" do
      expect(MusicService.find_similar_artists(artist)).to be_an Array
    end
    it "should be a list of artist name" do
      expect(MusicService.find_similar_artists(artist).first).to eq("Viktor Vaughn")
    end
  end
end
