module EmployeesHelper
  def sewed_clothing_total(sewed_clothing)
    total = 0.0
    sewed_clothing.each do |sc|
      total += sc.total
    end
    total
  end

  def format_address
    check_and_display @employee.address      
  end

  def format_age
    age = check_and_display(@employee.birthday)
    unless  age == 'N/A'
      distance_of_time_in_words(Date.current, @employee.birthday) + " old"
    else
      age
    end
  end

  def format_birthday
    check_and_display @employee.birthday
  end

  def format_contact_details
    check_and_display @employee.contact_details
  end

  def check_and_display(detail)
    if detail.nil? || detail.blank?
      'N/A'
    else     
      detail
    end
  end
end
