require 'spec_helper'

describe "Viewing the list of employees" do

  it "shows the list of employees" do
    Employee.create(employee_attributes)
    Employee.create(employee_attributes(first_name: "John Paul"))
    Employee.create(employee_attributes(first_name: "Jeyson"))

    visit employees_url

    user = User.create(user_attributes)
    visit employees_url
    fill_in("Login", with: "jay")
    fill_in("Password", with: "wilddust_2015")
    click_button("Sign in")

    expect(page).to have_text("Jay Paul Aying")
    expect(page).to have_text("John Paul Aying")
    expect(page).to have_text("Jeyson Aying")
  end

  it "has link to create new employee" do
    user = User.create(user_attributes)
    visit employees_url

    fill_in("Login", with: "jay")
    fill_in("Password", with: "wilddust_2015")
    click_button("Sign in")

    click_link("Add New Employee")
    expect(current_path).to eq(new_employee_path)
  end

end