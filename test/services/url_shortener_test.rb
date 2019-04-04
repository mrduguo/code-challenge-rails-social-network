require 'test_helper'

class UrlShortenerTest < ActiveSupport::TestCase
  test "should shorten fake url" do
    assert_equal "https://is.gd/5fcIAO", UrlShortener.make_url_short("http://foo.bar/zoo?a=b")
  end

  test "should throw error with empty url" do
    assert_raises OpenURI::HTTPError do
      UrlShortener.make_url_short("")
    end
  end

end