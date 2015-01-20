require 'spec_helper'

describe SewedClothing do
  it "compute total price" do
    ct = ClothingType.create(clothing_type_attributes(unit_price: 7))
    sc = SewedClothing.create(sewed_clothing_attributes(quantity: 3))
    sc.clothing_type = ct
    expect(sc.total).to eq(21)
  end

  it "gets only the sewed clothing of the current date" do
    sc = SewedClothing.create(sewed_clothing_attributes(created_at: "11/11/2014"))
    sc2 = SewedClothing.create(sewed_clothing_attributes)

    expect(SewedClothing.count).to eq(2)
    expect(SewedClothing.current_sewed.count).to eq(1)
  end
end
