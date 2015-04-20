class Artist < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :concerts

  def tracks
    MusicProvider.instance.tracks_from_artist(name)
  end
end
