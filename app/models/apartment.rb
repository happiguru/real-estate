class Apartment < ApplicationRecord
    validates :apartment_name, :city, :address, :description_short, :price, presence: true
end
