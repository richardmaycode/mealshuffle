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
  has_many :shuffle_recipes, dependent: :destroy

  # validates :share_token, presence: true

  before_create { self.share_token = generate_share_token }
  after_create :assign_recipes

  def reset_share_token
    update! share_token: generate_share_token
  end

  def expiration_date
    EXPIRATION_DAYS.days.from_now
  end

  def requested_recipes
    requested_recipes = Recipe.includes(:traits).where(traits: { id: trait_ids }).distinct.pluck(:id)
  end

  def assign_recipes
    recipes = requested_recipes.shuffle
    recipes.each_with_index do |recipe, index|
      puts "Assigning recipe #{recipe} to position #{index}"
      shuffle_recipes.create(recipe_id: recipe, position: index)
    end
  end

  def current_index
    shuffle_recipes.pending.order(:position).pluck(:position).first || 0
  end

  def voting_complete?
    shuffle_recipes.pending.empty?
  end

  def voting_tally
    shuffle_recipes.pluck(:status).tally
  end

  private

  def generate_share_token
    SecureRandom.alphanumeric(12).scan(/.{4}/).join("-")
  end
end
