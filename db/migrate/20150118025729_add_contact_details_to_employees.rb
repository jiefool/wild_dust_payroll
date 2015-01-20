class AddContactDetailsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :contact_details, :string
  end
end
