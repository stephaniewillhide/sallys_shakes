class Ingredient < ApplicationRecord
  has_and_belongs_to_many :shakes

  validates :name,
            presence: true,
            uniqueness: true

  validates :calories, presence: true

  scope :ordered, -> { order(name: :asc) }
end
