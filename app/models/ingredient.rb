class Ingredient < ApplicationRecord

  has_many :doses
  before_destroy :check_for_doses
  validates :name, presence: true, uniqueness:true
end
