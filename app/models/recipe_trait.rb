class RecipeTrait < ApplicationRecord
  belongs_to :recipe
  belongs_to :trait

  delegate :category, to: :trait, prefix: true
end
