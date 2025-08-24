class Shuffle < ApplicationRecord
  MAX_RANDOM_RECIPES = 20
  EXPIRATION_DAYS = 14

  has_one :user, required: false
  has_many :shuffle_traits, dependent: :destroy
  has_many :traits, through: :shuffle_traits

  has_many :proteins, -> { where category: :protein }, through: :shuffle_traits, source: :trait
  has_many :carbohydrates, -> { where category: :carbohydrate }, through: :shuffle_traits, source: :trait
  has_many :meals, -> { where category: :meal }, through: :shuffle_traits, source: :trait
  has_many :cuisines, -> { where category: :cuisine }, through: :shuffle_traits, source: :trait

  validates :share_token, presence: true

  before_create { self.share_token = generate_share_token }

  def reset_share_token
    update! share_token: generate_share_token
  end

  def expiration_date
    EXPIRATION_DAYS.days.from_now
  end

  private

  def generate_share_token
    SecureRandom.alphanumeric(12).scan(/.{4}/).join("-")
  end
end
