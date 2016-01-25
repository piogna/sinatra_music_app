class Track < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validate :url, :valid_url

  URL_REGEX = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/

  def valid_url
    errors.add(:url, "Link must be a valid URL") unless url = URL_REGEX || url.nil?
  end
end
