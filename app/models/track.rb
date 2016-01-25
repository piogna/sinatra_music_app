class Track < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validate :url, :valid_url
  validate :url_text, :url_must_be_provided

  URL_REGEX = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/

  def valid_url
    errors.add(:url, "Link must be a valid URL") unless url =~ URL_REGEX || url.nil?
  end
  def url_must_be_provided
    errors.add(:url_text, "URL must be provided if link text is present.") if url_text && url.nil?
  end
end
