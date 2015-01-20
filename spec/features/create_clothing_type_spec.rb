require 'spec_helper'

describe "Create clothing type" do
  it "add new clothing type and show on listing" do
    visit clothing_types_url
    log_in

    click_link 'Add Clothing Type'

    expect(current_path).to eq(new_clothing_type_path)

    fill_in('Name', :with => 'Short')
    fill_in('Unit price', :with => 30)
    fill_in('Description', :with => 'Lower clothing on basketball uniform')
    click_button 'Create Clothing type'

    expect(current_path).to eq(clothing_types_path)
    expect(page).to have_text('Short')
    expect(page).to have_text('30')
    expect(page).to have_text('Lower clothing on basketball uniform')
  end

  it "go back to employees listing when back is press" do
    visit new_clothing_type_url
    log_in
    click_link 'Back'
    expect(current_path).to eq(clothing_types_path)
  end
end