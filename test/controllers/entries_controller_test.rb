require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entries_url
    assert_response :success
  end

  test "should get show" do
    get entry_url(entries(:one))
    assert_response :success
  end
end
