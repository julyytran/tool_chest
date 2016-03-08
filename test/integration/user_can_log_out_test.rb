require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest

  test "logged out user sees home page" do
    skip
    user = User.create(username: "July", password: "password1")
    visit '/'
    click_on "log in"
    fill_in "Username", with: "July"
    fill_in "Password", with: "password1"
    click_on "log in"
    assert_equal "/users/#{user.id}", current_path
    click_on "log out"

    assert_equal '/', current_path
    assert page.has_content? "register"
    assert page.has_content? "log in"
  end
end
