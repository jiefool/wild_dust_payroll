module EmployeesHelper
  def sewed_clothing_total(sewed_clothing)
    total = 0.0
    sewed_clothing.each do |sc|
      total += sc.total
    end
    total
  end

  def format_contact_details(contact_details)
    contact_details.blank? ? "None" : contact_details
  end
end
