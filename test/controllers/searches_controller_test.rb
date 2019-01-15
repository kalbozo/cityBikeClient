require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "no city param in search causes error json" do
    get '/search'
    assert JSON.parse(response.body)['error'].present?
  end
  test "no city param in stations causes error json" do
    get '/stations'
    assert JSON.parse(response.body)['error'].present?
  end
end
