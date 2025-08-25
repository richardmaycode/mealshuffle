class Recipe < ApplicationRecord
  # self.strict_loading_by_default = true

  has_one_attached :image do |attachable|
      attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
      attachable.variant :medium, resize_to_limit: [ 400, 400 ]
      attachable.variant :large, resize_to_limit: [ 800, 800 ]
  end

  belongs_to :creator, class_name: "User"
  has_one :source, dependent: :destroy
  has_one :source_creator, through: :source, class_name: "Creator"
  has_many :recipe_traits, dependent: :destroy
  has_many :traits, through: :recipe_traits do
    def by_category(category)
      self.where(category: category)
    end

    def names_by_category(category)
      self.where(category: category).pluck(:name).join(", ")
    end
  end

  has_many :proteins, -> { where category: :protein }, through: :recipe_traits, source: :trait
  has_many :carbohydrates, -> { where category: :carbohydrate }, through: :recipe_traits, source: :trait
  has_many :meals, -> { where category: :meal }, through: :recipe_traits, source: :trait
  has_many :cuisines, -> { where category: :cuisine }, through: :recipe_traits, source: :trait

  validates :name, presence: true, length: { in: 2..100 }
  validates :servings, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
