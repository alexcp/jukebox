class Artist < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :concerts
  has_one :track

  after_save :add_track

  def add_track
    QC.enqueue("Track.new_job", id)
  end
end
