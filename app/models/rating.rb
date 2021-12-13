class Rating < ApplicationRecord
  belongs_to :store
  validates_presence_of :value, :opinion, :user_name
end

# irb> Rating.create(store: Store.first, value: 4, opinion: "muito bom o lugar", user_name: "Maiqui")