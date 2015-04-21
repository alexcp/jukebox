class Artist < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :concerts, uniq: true
  has_one :track

  def artwork_url
    track.try(:artwork_url)
  end
end
