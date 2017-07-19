require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "home display with logged in" do
    log_in_as(@user)
    get root_path
    assert_match @user.following.count.to_s, response.body
    assert_match @user.followers.count.to_s, response.body
  end
end
