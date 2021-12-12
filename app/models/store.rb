class Store < ApplicationRecord
  has_many :ratings # Store.last.ratings
  validates_presence_of :lonlat, :name, :google_place_id
  validates :google_place_id, uniqueness: true
end
