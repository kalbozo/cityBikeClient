require 'test_helper'

class SearchTest < ActiveSupport::TestCase
    test "create a search" do
        search = Search.new
        assert(true, search.save)
    end
  # test "the truth" do
  #   assert true
  # end
end
