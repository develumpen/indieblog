require "test_helper"

class EntryTest < ActiveSupport::TestCase
  test "entry is valid" do
    @entry = entries(:one)

    assert @entry.valid?
  end

  test "invalid without published_at" do
    @entry = entries(:one)
    @entry.published_at = nil

    assert_not @entry.valid?
    assert_not_empty @entry.errors[:published_at]
  end
end
