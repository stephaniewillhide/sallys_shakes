class Shake < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :ingredients

  scope :ordered, -> { order(name: :asc) }

  def calories_per_shake
    calorie_array = ingredients.map { |ingredient| ingredient.calories }
    calorie_array.sum
  end
end
