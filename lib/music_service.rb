class MusicService
  attr_reader :lastfm

  def self.find_similar_artists artist
    new.find_artist(artist.name)
  end

  def initialize
    @lastfm = Lastfm.new(ENV["LAST_FM_CLIENT"], ENV["LAST_FM_SECRET"])
  end

  def find_artist artist_name
    response = @lastfm.artist.get_similar(artist: artist_name)
    response.shift
    response.map{|x| x["name"]}
  end

end
