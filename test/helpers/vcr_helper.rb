require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures_vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.ignore_localhost = true
end
