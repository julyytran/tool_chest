require 'test_helper'

class UserCanLogInTest < ActionDispatch::IntegrationTest

  test "existing user sees name on dashboard" do
    skip
    user = User.create(username: "July", password: "password1")

    visit '/'
    click_on 'log in'
    fill_in "Username", with: "July"
    fill_in "Password", with: "password1"

    click_on "Log in"

    assert_equal "/users/#{user.id}", current_path
    assert page.has_content? "Welcome, #{user.username}"
  end
end
