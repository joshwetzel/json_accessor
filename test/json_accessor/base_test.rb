require 'test_helper'

class BaseTest < Minitest::Test
  def setup
    @user = User.new
  end

  def test_defines_getters
    assert_respond_to @user, :preferences_notifications_issues
    assert_respond_to @user, :preferences_notifications_marketing
    assert_respond_to @user, :preferences_tfa_codes
    assert_respond_to @user, :preferences_tfa_enabled
    assert_respond_to @user, :preferences_time_zone
  end

  def test_defines_setters
    assert_respond_to @user, :preferences_notifications_issues=
    assert_respond_to @user, :preferences_notifications_marketing=
    assert_respond_to @user, :preferences_tfa_codes=
    assert_respond_to @user, :preferences_tfa_enabled=
    assert_respond_to @user, :preferences_time_zone=
  end

  def test_getters
    assert_equal true, @user.preferences_notifications_issues
    assert_nil @user.preferences_notifications_marketing
    assert_nil @user.preferences_tfa_codes
    assert_nil @user.preferences_tfa_enabled
    assert_equal 'UTC', @user.preferences_time_zone
  end

  def test_setters
    @user.preferences_notifications_issues = false
    assert_equal false, @user.preferences['notifications']['issues']

    @user.preferences_notifications_marketing = false
    assert_equal false, @user.preferences['notifications']['marketing']

    @user.preferences_tfa_codes = ['b3de640c', '45fadacb']
    assert_equal ['b3de640c', '45fadacb'], @user.preferences['tfa']['codes']

    @user.preferences_tfa_enabled = true
    assert_equal true, @user.preferences['tfa']['enabled']

    @user.preferences_time_zone = 'Eastern Time (US & Canada)'
    assert_equal 'Eastern Time (US & Canada)', @user.preferences['time_zone']
  end
end
