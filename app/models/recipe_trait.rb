class RecipeTrait < ApplicationRecord
  belongs_to :recipe
  belongs_to :trait, counter_cache: true
  has_many :proteins, through: :recipe
  has_many :cuisines, through: :recipe
  has_many :meals, through: :re

  delegate :category, to: :trait, prefix: true
end
