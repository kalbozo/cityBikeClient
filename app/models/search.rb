class Search < ApplicationRecord
    has_and_belongs_to_many :networks
    validates :city, presence: true

    before_save {
        city.downcase!
    }
end
