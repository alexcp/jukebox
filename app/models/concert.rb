class Concert < ActiveRecord::Base
  validates :artist_id, :date, :time, :venue_id, presence: true
  validates :price, numericality: true
end
