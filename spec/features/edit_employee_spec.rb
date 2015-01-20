require 'spec_helper'

describe "Edit employee" do 
  it "update employee" do
    e = Employee.create(employee_attributes)
    visit employee_url e
    log_in
    click_link('Edit')

    expect(current_path).to eq(edit_employee_path e)
    expect(find_field('First name').value).to eq(e.first_name)

    fill_in 'First name', with: "Jay Paul Gwapo"
    click_button 'Update Employee'

    expect(current_path).to eq(employee_path e)
    expect(page).to have_text("Jay Paul Gwapo")
  end

  it "has back button and goes back to employee details" do
    e = Employee.create(employee_attributes)
    visit edit_employee_url e
    log_in
    click_link('Back')

    expect(current_path).to eq(employee_path e)
  end
end