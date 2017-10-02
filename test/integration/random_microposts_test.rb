require 'test_helper'
require 'json'

class RandomMicropostsTest < ActionDispatch::IntegrationTest
  test "random microposts" do
    get random_path
    assert_response :success
    microposts = JSON.parse(response.body)
    assert_match "content", response.body
    assert_match "user_id", response.body
    assert_equal(microposts["microposts"].length, 10)
  end
end
