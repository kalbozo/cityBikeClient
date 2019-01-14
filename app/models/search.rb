class Search < ApplicationRecord
    has_and_belongs_to_many :networks
    validates :city, presense: true

    before_save {
        city.downcase!
    }
end
