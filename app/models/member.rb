class Member < ApplicationRecord
  HUMANIZED_ATTRIBUTES = {
      :url_long => "Website"
  }
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :url_long, url: true
end
