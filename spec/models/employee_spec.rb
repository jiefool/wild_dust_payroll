require 'spec_helper'

describe Employee do
  it "display full name" do
  	e = Employee.create(employee_attributes)
  	expect(e.full_name).to eq("Jay Paul Aying")
  end

  it "sewed clothing dates" do
    e = Employee.create(employee_attributes)
    ct = ClothingType.create(clothing_type_attributes)
    ct2 = ClothingType.create(clothing_type_attributes)
    e.sewed_clothings.create!(sewed_clothing_attributes(created_at: '12/1/2014'))
    e.sewed_clothings.create!(sewed_clothing_attributes(created_at: '12/2/2014'))

    expect(e.sewed_clothing_dates.include? '12/1/2014').to eq(true)
    expect(e.sewed_clothing_dates.include? '12/2/2014').to eq(true)
  end

  it "has formatted sewed_clothing dates" do
    e = Employee.create(employee_attributes)
    ct = ClothingType.create(clothing_type_attributes)
    ct2 = ClothingType.create(clothing_type_attributes)
    e.sewed_clothings.create!(sewed_clothing_attributes(created_at: '12/1/2014'))
    e.sewed_clothings.create!(sewed_clothing_attributes(created_at: '12/2/2014'))

    expect(e.formatted_sewed_clothing_dates.include? '12/1/2014'.to_date).to eq(true)
    expect(e.formatted_sewed_clothing_dates.include? '12/2/2014'.to_date).to eq(true)
  end
end
