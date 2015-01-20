require 'spec_helper'

describe "List clothing type"  do 
  it "list all clothing types" do
    ct = ClothingType.create(clothing_type_attributes)
    visit clothing_types_url
    log_in

    expect(current_path).to eq(clothing_types_path)
    expect(page).to have_text("Jersey")
    expect(page).to have_text("Upper clothing of Basketball")
  end

  it "goes to edit page when edit button is clicked" do
    ct = ClothingType.create(clothing_type_attributes)
    visit clothing_types_url
    log_in
    click_link('Edit')

    expect(current_path).to eq(edit_clothing_type_path ct)
    expect(page).to have_field('Name')
    expect(page).to have_field('Description')
  end
end