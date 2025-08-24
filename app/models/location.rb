class Location < ApplicationRecord
  enum :platform, { facebook: 0, youtube: 1, instagram: 2, tiktok: 3, threads: 4, website: 5 }, default: :tiktok

  belongs_to :creator, inverse_of: :locations

  validates :handle, presence: true, length: { maximum: 255 }
  validates :platform, presence: true
end
