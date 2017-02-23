class Review < ApplicationRecord
  belongs_to :restuarant
  
  validates :rating, inclusion: (1..5)
end
