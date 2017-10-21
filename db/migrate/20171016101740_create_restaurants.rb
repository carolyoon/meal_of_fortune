class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.string :url
      t.string :address
      t.integer :rating
      t.string :price
      t.references :cuisine

      t.timestamps
    end 
  end
end
