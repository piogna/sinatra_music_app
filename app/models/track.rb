class Track < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validate :url, :valid_url

  before_create :set_url_text_to_nil_if_url_is_nil

  URL_REGEX = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/

  def valid_url
    errors.add(:url, "Link must be a valid URL") unless url =~ URL_REGEX || url.nil?
  end

  def set_url_text_to_nil_if_url_is_nil
    url_text = nil if url.nil?
  end
end
