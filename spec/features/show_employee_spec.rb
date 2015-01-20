require 'spec_helper'

describe "Show employee" do
	it "show employee details" do
		e = Employee.create(employee_attributes)
    visit employees_url

   log_in

    click_link e.full_name

    expect(current_path).to eq(employee_path e)
    expect(page).to have_text(e.full_name)
    expect(page).to have_text("over 24 years old")
    expect(page).to have_text(e.birthday)
    expect(page).to have_text(e.address)
	end

  it "has link to edit employee" do
    e = Employee.create(employee_attributes)
    visit employee_url e
    log_in
    click_link('Edit')
    expect(current_path).to eq(edit_employee_path e)
  end

  it "has link to delete employee" do
    e = Employee.create(employee_attributes)
    visit employee_url e
    log_in
    click_link('Delete')
    expect(current_path).to eq(employees_path)
  end

  it "has sewed clothings" do
    e = Employee.create(employee_attributes)
    ct = ClothingType.create(clothing_type_attributes)
    sc = SewedClothing.create(sewed_clothing_attributes(clothing_type_id: ct.id, employee_id: e.id))
    visit employee_url e
    log_in

    expect(current_path).to eq(employee_path e)
    expect(page).to have_text(sc.owner_name)
  end

  it "can create new sewed clothing" do
    e = Employee.create(employee_attributes)
    ct = ClothingType.create(clothing_type_attributes)
    sc = SewedClothing.create(sewed_clothing_attributes(clothing_type_id: ct.id, employee_id: e.id))
    visit employee_url e
    log_in

    fill_in("Owner name", with: "jay")
    find("#sewed_clothing_clothing_type_id").find(:xpath, 'option[2]').select_option
    fill_in("Quantity", with: 1)
    click_button("Create Sewed clothing")

    expect(page).to have_text("jay")
    expect(page).to have_text(ct.name)
    expect(page).to have_text(ct.unit_price)
  end
end