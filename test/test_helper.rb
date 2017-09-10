require 'json_accessor'
require 'minitest/autorun'

class User
  extend JSONAccessor

  attr_accessor :preferences

  json_accessor :preferences, :notifications, :issues
  json_accessor :preferences, :notifications, :marketing
  json_accessor :preferences, :tfa, :codes
  json_accessor :preferences, :tfa, :enabled
  json_accessor :preferences, :time_zone

  def initialize
    @preferences = {
      'notifications' => {
        'issues' => true
      },
      'time_zone' => 'UTC'
    }
  end
end
