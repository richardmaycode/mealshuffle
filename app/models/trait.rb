class Trait < ApplicationRecord
  enum :category, { protein: 0, carbohydrate: 1, meal: 2, cuisine: 3 }, default: :protein, prefix: "trait_"
end
