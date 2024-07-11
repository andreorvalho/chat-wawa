require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "returns email without domain as name" do
    user = users(:user_andre)
    assert user.name == 'Andre'
  end
end
