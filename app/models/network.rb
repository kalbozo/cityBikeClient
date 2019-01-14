class Network < ApplicationRecord
    attr_accessor :href, :name, :city
    has_and_belongs_to_many :searches, required: false
end
