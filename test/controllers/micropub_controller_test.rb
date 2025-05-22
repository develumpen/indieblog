require "test_helper"

class MicropubControllerTest < ActionDispatch::IntegrationTest
  test "error if invalid h type" do
    params = { h: "not_entry" }

    post micropub_url, params: params

    assert_response :bad_request
  end
  test "creates a note" do
    params = { h: "entry", content: "The content" }

    post micropub_url, params: params

    assert_response :created
  end

  test "create a note returns location header" do
    params = { h: "entry", content: "The content" }

    post micropub_url, params: params

    assert_equal entry_url(Entry.last), @response.headers["Location"]
  end
end
