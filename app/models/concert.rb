class Concert < ActiveRecord::Base
  belongs_to :artist
  belongs_to :venue

  validates :artist, :date, :time, :venue, presence: true
  validates :price, numericality: true
end
