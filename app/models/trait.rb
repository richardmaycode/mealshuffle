class Trait < ApplicationRecord
  enum :category, { protein: 0, carbohydrate: 1, meal: 2, cuisine: 3 }

  has_many :recipe_traits, dependent: :destroy
  has_many :recipes, through: :recipe_traits

  def self.icon(category)
    case category
    when :protein
      "chicken-thigh.svg"
    when :carbohydrate
      "wheat.svg"
    when :meal
      "date-time.svg"
    when :cuisine
      "globe.svg"
    end
  end
end
