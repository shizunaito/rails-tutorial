require 'test_helper'

class UsersUserinfoTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "get user information through userinfo api" do
    get profile_user_path(@user)
    assert_match "id", response.body
    assert_match "name", response.body
    assert_match "Michael Example", response.body
    assert_match "avatar", response.body
    assert_match "gravatar", response.body
  end
end
