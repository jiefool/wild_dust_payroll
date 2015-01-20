require 'spec_helper'

describe "Employee sewed clothing" do
  it "show employee sewed clothing" do
    e = Employee.create(employee_attributes)
    ct = ClothingType.create(clothing_type_attributes(unit_price: 7))
    sc = e.sewed_clothings.create!(sewed_clothing_attributes(quantity:3, clothing_type_id: ct.id))

    visit employee_url e
    log_in

    expect(current_path).to eq(employee_path e)
    expect(page).to have_text(e.full_name)
    expect(page).to have_text(sc.owner_name)
    expect(page).to have_text(sc.quantity)
    expect(page).to have_text(ct.unit_price)
    expect(page).to have_text(ct.name)
    expect(page).to have_text("21")
  end
end