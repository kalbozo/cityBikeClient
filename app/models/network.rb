class Network < ApplicationRecord
    validates :href, presence: true
    validates :city, presence: true
    has_and_belongs_to_many :searches, required: false

    before_save {
        #puts JSON.parse(self)
        self.city.downcase!
    }
end
