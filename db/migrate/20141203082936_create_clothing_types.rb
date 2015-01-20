class CreateClothingTypes < ActiveRecord::Migration
  def change
    create_table :clothing_types do |t|
      t.string :name
      t.text :description
      t.float :unit_price      
      t.timestamps
    end
  end
end
