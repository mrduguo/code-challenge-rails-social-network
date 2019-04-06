require 'test_helper'

class HeadingExtractorTest < ActiveSupport::TestCase
  test "should extract existing tags" do
    assert_equal ["h1-h6 elements", "h1 heading", "Pass Criteria", "Reference", "Test hd-001: h1 - h6 elements", "h2 heading", "Test hd-002: span element, with role=\"heading\" & aria-level=\"1\"", "Test hd-003: h2 element, with aria-level=\"1\"", "Heading Level 1?", "Test hd-004: h1 - h6 elements with no content", "h3 heading"], HeadingExtractor.extract_heading("https://thepaciellogroup.github.io/AT-browser-tests/test-files/h1-h6.html")
    # assert_equal "https://is.gd/5fcIAO", HeadingExtractor.extract_heading("https://github.com/mrduguo")
  end

  test "should throw error with empty tag on the page" do
    assert_raises RuntimeError do
      HeadingExtractor.extract_heading("https://httpbin.org/anything")
    end
  end

  test "should throw error with invalid url" do
    assert_raises SocketError do
      HeadingExtractor.extract_heading("http://url.not.exit")
    end
  end

end