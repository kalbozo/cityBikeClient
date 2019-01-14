class Network < ApplicationRecord
    #attr_accessor :href, :name, :city
    validates :href, presence: true
    validates :city, presense: true
    has_and_belongs_to_many :searches, required: false

    before_save {
        name.downcase!
        city.downcase!
    }
end
