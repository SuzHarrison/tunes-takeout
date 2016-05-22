# configure minitest, vcr, and webmock to work together
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/spec'
require "minispec-metadata"
require 'vcr'
require 'minitest-vcr'
require 'webmock/minitest'
require "minitest/reporters"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
MinitestVcr::Spec.configure!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:spotify_known] = OmniAuth::AuthHash.new( {provider: 'spotify', info: { id: "known_user", display_name: "known_user"}})

  OmniAuth.config.mock_auth[:spotify_unknown] = OmniAuth::AuthHash.new( {provider: 'spotify', info: { id: "1226771573", display_name: "Suzanne Convertino Harrison"}})

  OmniAuth.config.mock_auth[:spotify_uid] = OmniAuth::AuthHash.new( {provider: 'spotify', uid: "preferred", info: { id: "not", display_name: " "}})



  # Add more helper methods to be used by all tests here...
end
