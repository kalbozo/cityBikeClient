require 'test_helper'

class NetworkTest < ActiveSupport::TestCase
    test "create a network" do
        network = Network.new
        network.href = "/tmp"
        assert(network.save, "Did not save")
    end

    test "create a network with NULL href" do
        network = Network.new
        assert_raise(ActiveRecord::NotNullViolation) do 
            network.save
        end
    end
  # test "the truth" do
  #   assert true
  # end
end
