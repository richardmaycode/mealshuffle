class RecipeTrait < ApplicationRecord
  belongs_to :recipe
  belongs_to :trait, counter_cache: true

  delegate :category, to: :trait, prefix: true
end
