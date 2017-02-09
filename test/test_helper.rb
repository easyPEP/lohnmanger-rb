require './lib/lohnmanger'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end

def test_lohnmanger_token
  ENV['LOHNMANAGER_API_KEY']
end

def test_lohnmanger_account
  ENV['LOHNMANAGER_COMPANY_NO']
end

def api_token_client
  Lohnmanger::Client.new(
  	apiKey: test_lohnmanger_token,
    companyNo: test_lohnmanger_account
  )
end
