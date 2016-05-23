require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    # @known = OmniAuth.config.mock_auth[:spotify_known]
    @known = users(:known_user)
    @unknown = users(:unknown_user)
    # @unknown_with_uid = OmniAuth.config.mock_auth[:spotify_uid]
  end

  test "can find an existing user given an oauth spotify hash" do
    @auth_hash = {"info" => {"display_name" => "Suzanne Convertino Harrison", "id" => "1226771573"}, "provider" => "spotify"}
    assert_equal @known, User.find_or_create_from_omniauth(@auth_hash)
  end

  test "can make a new user given the oauth spotify hash of an unknown user" do
    @adriana_auth_hash = {"info" => {"display_name" => "Adriana Cannon", "id" => "dri19tcc", "images" => ["url" => ""]}, "provider" => "spotify"}
    assert_difference 'User.count', 1 do
      @user = User.find_or_create_from_omniauth(@adriana_auth_hash)
    end
  end

  test "uses oauth data to set user name, provider and uid for new users" do
    @auth_hash_fake = {"info" => {"display_name" => "Adriana Smith", "id" => "1234", "images" => ["url" => ""]}, "provider" => "spotify"}
    user = User.find_or_create_from_omniauth(@auth_hash_fake)
    assert_equal @unknown['name'], user.name
    assert_equal @unknown['provider'], user.provider
    assert_equal @unknown['uid'], user.uid
  end

  # test "prefers a top-level uid over a nested id when creating an oauth user" do
  #   user = User.find_or_create_from_omniauth @unknown_with_uid
  #   assert_equal @unknown_with_uid['uid'], user.uid
  # end
end
