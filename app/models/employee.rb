class Employee < ActiveRecord::Base
  has_many :sewed_clothings, dependent: :destroy
  validates_presence_of :first_name,
                        :last_name

	def full_name
		"#{first_name} #{last_name}"
	end

  def formatted_sewed_clothing_dates
    sewed_clothing_dates.map {|date| date.to_date}
  end

  def sewed_clothing_dates
    sewed_clothings.group("DATE(created_at)").reorder("created_at DESC").pluck(:created_at)
  end
end
