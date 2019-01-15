require 'test_helper'

class SearchTest < ActiveSupport::TestCase
    test "create a search" do
        search = Search.new
        search.city = "tmp"
        assert(search.save)
    end

    test "search with no city should fail" do
        search = Search.new
        assert_not(search.save)
    end
  # test "the truth" do
  #   assert true
  # end
end
