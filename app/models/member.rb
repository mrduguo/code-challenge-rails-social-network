class Member < ApplicationRecord
  HUMANIZED_ATTRIBUTES = {
      :url_long => "Website"
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :url_long, url: true

  has_many :headings, dependent: :delete_all, autosave: true

  has_many :friends,  inverse_of: :member
  has_many :friend_members, through: :friends, dependent: :destroy

  before_save :shorten_url
  after_save :populate_headings

  private

  def shorten_url
    begin
      self.url_short = UrlShortener.make_url_short(self.url_long)
    rescue => e
      errors.add(:url_long, "failed to shorten url: #{e.message}")
      raise e
    end
  end

  def populate_headings
    self.headings.destroy_all unless self.headings.empty?
    begin
      HeadingExtractor.extract_heading(self.url_long).each do |heading|
        self.headings.create text: heading
      end
    rescue => e
      errors.add(:url_long, "failed to fetch headings from the url: #{e.message}")
      raise e
    end
  end
end
