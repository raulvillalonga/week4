class Concert < ActiveRecord::Base

  has_many :comments


  validates :band, :venue, :city, :date, :price, :description, presence: true
  validates :price, numericality: { only_integer: true }
end
