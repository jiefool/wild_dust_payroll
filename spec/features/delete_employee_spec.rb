require 'spec_helper'

describe "Deleting an employee" do
 it "destroy the employee and show listing without the employee" do
    e = Employee.create(employee_attributes)
    e2 = Employee.create(employee_attributes(first_name: "Jeyson"))
    visit employee_url e
    log_in

    visit employee_url e
    click_link('Delete')

    expect(current_path).to eq(employees_path)
    expect(page).to have_text('Jeyson')
    expect(page).not_to have_text('Jay Paul')
  end
end