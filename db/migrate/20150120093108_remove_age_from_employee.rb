class RemoveAgeFromEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :age, :integer
  end
end
