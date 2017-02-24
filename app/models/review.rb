class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :rating, inclusion: (1..5)
  validates :user_id, :uniqueness => { :scope => :restaurant_id, :message => 'You can only review a restaurant once!' } # allowing your to only review a restaurant once
end
