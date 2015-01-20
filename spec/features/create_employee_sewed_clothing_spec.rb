require 'spec_helper'

describe "Create sewed clothing for employee" do
  it "goes to employee page, fill in form and create sewed clothing for employee" do
    e = Employee.create(employee_attributes)
    ClothingType.create(clothing_type_attributes)
    ClothingType.create(clothing_type_attributes(name: "Short"))

    visit employee_url e
    log_in

    expect(current_path).to eq(employee_path e)

    fill_in('Owner name', :with => 'Ronald Baluran')
    find("#sewed_clothing_clothing_type_id").find(:xpath, 'option[2]').select_option
    fill_in('Quantity', :with => 2)
    click_button('Create Sewed clothing')

    expect(current_path).to eq(employee_path e)
    expect(page).to have_text('Ronald Baluran')
  end
end
