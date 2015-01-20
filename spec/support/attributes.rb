def employee_attributes(overrides = {})
  {
    first_name: "Jay Paul",
    last_name: "Aying",
    address: "Tagbilaran City",
    birthday: "1990-09-13".to_date
  }.merge(overrides)
end

def clothing_type_attributes(overrides = {})
  {
    name: "Jersey",
    unit_price: 20.25,
    description: "Upper clothing of Basketball"
  }.merge(overrides)
end

def sewed_clothing_attributes(overrides = {})
  {
    owner_name: "Charles Migrino",
    quantity: 2,
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    username: "jay",
    email: "jaypaulaying5@gmail.com",
    password: "wilddust_2015"
  }.merge(overrides)
end

def log_in
  user = User.create(user_attributes)
  fill_in("Login", with: "jay")
  fill_in("Password", with: "wilddust_2015")
  click_button("Sign in")
end