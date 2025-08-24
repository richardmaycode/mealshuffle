class Shuffle < ApplicationRecord
  has_one :user, required: false

  validates :share_token, presence: true

  before_create { self.share_token = generate_share_token }

  def reset_share_token
    update! share_token: generate_share_token
  end

  private

  def generate_share_token
    SecureRandom.alphanumeric(12).scan(/.{4}/).join("-")
  end
end
