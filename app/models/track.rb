class Track < ActiveRecord::Base
  belongs_to :artist
  validates :artist, :url, presence: true

  def self.new_track_for_artist artist_id
    artist = Artist.find(artist_id)
    if track = MusicProvider.track_for_artist(artist)
      track.save
      track
    end
  end
end
