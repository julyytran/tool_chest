require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  test "valid user sees name on dashboard" do
    visit '/'
    click_on "register"
    fill_in "Username", with: "July"
    fill_in "Password", with: "password1"
    click_on "Create Account"
    user = User.last

    assert_equal "/users/#{user.id}", current_path

    assert page.has_content? "Welcome, #{user.username}"
  end
end
