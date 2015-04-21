class Concert < ActiveRecord::Base
  belongs_to :venue
  has_and_belongs_to_many :artists, uniq: true

  validates :artists, :date, :time, :venue, presence: true
  validates :price, numericality: true
  validates :venue, uniqueness: {scope: [:date, :time]}
end
