class Artist < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :concerts
  has_one :track

  after_save :add_track

  def artwork_url
    track.try(:artwork_url)
  end

  def add_track
    QC.enqueue("Track.new_track_for_artist", id)
  end
end
