class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :apartmentId
      t.string :apartment_name
      t.string :apartmentimg
      t.string :city
      t.string :address
      t.text :description_short
      t.text :description_long
      t.string :price
      
      t.timestamps
    end
  end
end
