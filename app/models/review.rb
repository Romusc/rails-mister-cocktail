class Review < ApplicationRecord
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail_id, presence: true
end

