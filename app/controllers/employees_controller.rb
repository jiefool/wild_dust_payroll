class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @sewed_date = params[:sew_date].blank? ? Time.now : params[:sew_date].to_date
    @sewed_clothings_on_date = @employee.sewed_clothings.sewed_on_date(@sewed_date.strftime("%Y-%m-%d"))
    @sewed_clothing = @employee.sewed_clothings.new
    @sewed_clothing_dates = sewed_clothing_dates(@employee).uniq
  end

  def sewed_clothing_dates(employee)
    employee.sewed_clothings.pluck(:created_at).map do |date|
      date.to_date
    end    
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
    redirect_to @employee
  end

  def edit
    @employee =  Employee.find(params[:id])
  end

  def destroy
    Employee.find(params[:id]).destroy
    redirect_to employees_url
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employee_url @employee
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :address, :contact_details, :birthday)
  end
end
