class Rating < ApplicationRecord
  belongs_to :store
  validate_presence_of :value, :options, :user_name
end