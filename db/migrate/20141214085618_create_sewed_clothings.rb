class CreateSewedClothings < ActiveRecord::Migration
  def change
    create_table :sewed_clothings do |t|
      t.belongs_to :clothing_type
      t.string :owner_name
      t.integer :quantity
      t.integer :clothing_type_id
      t.references :employee, index: true
      t.timestamps
    end
  end
end
