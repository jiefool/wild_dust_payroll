class ClothingType < ActiveRecord::Base
  validate_presence_of  :name,
                        :unit_price
  has_many :sewed_clothings
end
