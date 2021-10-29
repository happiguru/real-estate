class ApartmentSerializer < ActiveModel::Serializer
    attributes :id, :apartment_name, :city, :address, :description_short, :description_long, :price
end
