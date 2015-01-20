require 'spec_helper'

describe "Create employee" do
	it "add new employee" do
    visit new_employee_url
    log_in

    fill_in('First name', :with => 'Felicisimo')
    fill_in('Last name', :with => 'Aying')
    fill_in('Address', :with => 'Tagbilaran city')
    fill_in('Birthday', :with => '1959/6/30')

    click_button('Create Employee')

    expect(current_path).to eq(employee_path(Employee.last))
    expect(page).to have_text('Felicisimo Aying')
    expect(page).to have_text('Tagbilaran city')
    expect(page).to have_text('over 55 years old')
    expect(page).to have_text('1959-06-30')
  end
end