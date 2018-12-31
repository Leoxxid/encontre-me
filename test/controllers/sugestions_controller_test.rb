require 'test_helper'

class SugestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sugestions_index_url
    assert_response :success
  end

end
