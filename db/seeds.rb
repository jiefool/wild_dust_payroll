e1 = Employee.create(first_name: "Jay Paul",
                last_name: "Aying",
                address: "Ma. Clara st., Tagbilaran City",
                birthday: '1990-09-13')

c1 = ClothingType.create(name: "Jersey",
                        unit_price: 25,
                        description: "Basketball uniform upper")

c2 = ClothingType.create(name: "Short",
                        unit_price: 27,
                        description: "Basketball uniform lower")

s1 = e1.sewed_clothings.create!(owner_name: "Carmelita Aying",
                          quantity: 1,
                          clothing_type_id: c1.id)

s2 = e1.sewed_clothings.create!(owner_name: "Felicisimo Aying",
                          quantity: 2,
                          clothing_type_id: c2.id)