require "cgi"
require "open-uri"

class UrlShortener
  class << self
    def make_url_short(long_url)
      request_url = url_template.sub 'LONG_URL', CGI.escape(long_url)
      URI.parse(request_url).read
    end

    private

    def url_template
      @url_template ||= Rails.configuration.services[:url_shortener][:url_template]
    end

  end
end