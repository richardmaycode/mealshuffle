class Source < ApplicationRecord
  belongs_to :recipe
  belongs_to :creator

  def url_domain
    URI.parse(url).host
  end
end
