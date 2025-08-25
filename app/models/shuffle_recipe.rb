class ShuffleRecipe < ApplicationRecord
  enum :status, { pending: 0, approved: 1, rejected: 2, skipped: 3 }, default: :pending

  belongs_to :shuffle
  belongs_to :recipe

  validates :position, presence: true, numericality: { greater_than_or_equal_to: 0 }, uniqueness: { scope: :shuffle_id }
end
