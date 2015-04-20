class Track < ActiveRecord::Base
  belongs_to :artist
  validates :artist, :url, presence: true

  def self.new_track_for_artist artist
    if track_info = MusicProvider.track_for_artist(artist.name)
      create(track_info.merge(artist: artist))
    end
  end
end
