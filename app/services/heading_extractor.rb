require 'nokogiri'
require "open-uri"

class HeadingExtractor
  class << self
    def extract_heading(url)
      doc = Nokogiri::HTML(open(url))
      headings = doc.css(*tags)
                     .collect {|link| link.content.squish}
                     .reject {|i| i.empty?}
      raise "no #{tags} found on page" if headings.empty?
      headings
    end

    private

    def tags
      @tags ||= Rails.configuration.services[:heading_extractor][:tags]
    end

  end
end