require "test_helper"

class UserCanEditAToolTest < ActionDispatch::IntegrationTest

  test "user can edit an existing tool" do
    tool = Tool.create(name: "Screwdriver", quantity: 10, price: 10000)

    visit edit_tool_path(tool)

    fill_in "Name", with: "Wrench"
    fill_in "Quantity", with: "11"
    fill_in "Price", with: "2000"

    click_button "Update Tool"

    assert_equal current_path, tool_path(tool.id)

    within(".tool_info") do
      assert page.has_content?("Wrench")
      assert page.has_content?("11")
      assert page.has_content?("20.0")
    end
  end
end
