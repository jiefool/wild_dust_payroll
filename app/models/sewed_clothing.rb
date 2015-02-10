class SewedClothing < ActiveRecord::Base
  validate_precense_of :owner_name, :quantity, :clothing_type_id
  belongs_to :employee
  belongs_to :clothing_type
  scope      :current_sewed, -> { where("created_at BETWEEN '#{DateTime.now.midnight.to_s(:db)}' AND '#{((DateTime.now.midnight)+1).to_s(:db)}'") }

  def total
    clothing_type.unit_price * quantity
  end

  def self.sewed_on_date(date)
    where("created_at LIKE ?", "%#{date}%")
  end
end

