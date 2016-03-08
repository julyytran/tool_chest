require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  should belong_to(:user)
end
