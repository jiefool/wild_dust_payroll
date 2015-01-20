require 'spec_helper'

describe "Editing of clothing type" do
  it "edit and shows the updated clothing_type" do
    ct = ClothingType.create(clothing_type_attributes)
    visit clothing_types_url
    log_in
    click_link 'Edit'

    expect(current_path).to eq(edit_clothing_type_path ct)
    expect(find_field('Name').value).to eq('Jersey')
    expect(find_field('Description').value).to have_text('Upper clothing of Basketball')

    fill_in('Name', :with => 'Jersey II')
    click_button 'Update Clothing type'

    expect(page).to have_text('Jersey II')
  end

  it "go back to clothing type detail page when cancel it press" do
    ct = ClothingType.create(clothing_type_attributes)
    visit clothing_types_url
    log_in
    click_link 'Edit'

    expect(current_path).to eq(edit_clothing_type_path ct)
    click_link 'Back'
    expect(current_path).to eq(clothing_types_path)
  end

end