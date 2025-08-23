class Trait < ApplicationRecord
  enum :category, { protein: 0, carbohydrate: 1, meal: 2, cuisine: 3 }, default: :protein

  has_many :recipe_traits, dependent: :destroy
  has_many :recipes, through: :recipe_traits
end
