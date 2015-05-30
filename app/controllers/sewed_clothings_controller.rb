class SewedClothingsController < ApplicationController
  def create
    @clothing_type = ClothingType.find(sewed_clothing_params[:clothing_type_id])
    @employee = Employee.find(params[:employee_id])
    @sewed_date = params[:sew_date].blank? ? Time.now : params[:sew_date].to_date
    @sewed_clothings_on_date = @employee.sewed_clothings.sewed_on_date(@sewed_date.strftime("%Y-%m-%d"))
    @sewed_clothing = @employee.sewed_clothings.create(sewed_clothing_params)
    # render :template => "employees/show"
    redirect_to @employee
  end

  def edit
    common_variables
    render :template => "employees/show"
  end

  def update
    common_variables
    @sewed_clothing.update(sewed_clothing_params)
    redirect_to @employee
  end

  def destroy
    common_variables
    @sewed_clothing.destroy
    redirect_to @employee
  end

  private
    def common_variables
      @employee = Employee.find(params[:employee_id])
      @sewed_clothing = @employee.sewed_clothings.find(params[:id])
      @sewed_date = params[:sew_date].blank? ? Time.now : params[:sew_date].to_date
      @sewed_clothings_on_date = @employee.sewed_clothings.sewed_on_date(@sewed_date.strftime("%Y-%m-%d"))
    end

    def sewed_clothing_params
      params.require(:sewed_clothing).permit(:owner_name, :clothing_type_id, :quantity)
    end
end
