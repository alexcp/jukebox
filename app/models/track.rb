class Track < ActiveRecord::Base
  belongs_to :artist
  validates :artist, :url, presence: true

  def self.new_track_for_artist artist
    if track_info = MusicProvider.track_for_artist(artist.name)
      create(track_info.merge(artist: artist))
    end
  end

  def self.new_job artist_id
    artist = Artist.find(artist_id)
    new_track_for_artist(artist)
  end
end
