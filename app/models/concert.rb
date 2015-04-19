class Concert < ActiveRecord::Base
  belongs_to :venue
  has_and_belongs_to_many :artists

  validates :artists, :date, :time, :venue, presence: true
  validates :price, numericality: true
end
