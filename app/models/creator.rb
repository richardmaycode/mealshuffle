class Creator < ApplicationRecord
  has_many :locations, dependent: :destroy, inverse_of: :creator
  has_many :sources, dependent: :destroy
  has_many :recipes, through: :sources

  accepts_nested_attributes_for :locations, allow_destroy: true

  validates :display_name, presence: true
end
