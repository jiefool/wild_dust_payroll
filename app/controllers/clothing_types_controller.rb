class ClothingTypesController < ApplicationController
  before_action :authenticate_user!
	def index
    @clothing_type = ClothingType.all
  end

  def new
    @clothing_type = ClothingType.new
  end

  def create
    @clothing_type = ClothingType.new(clothing_type_params)
    @clothing_type.save
    redirect_to clothing_types_path
  end

  def show
    @clothing_type = ClothingType.find(params[:id])
  end

  def edit
    @clothing_type = ClothingType.find(params[:id])
  end

  def update
    @clothing_type = ClothingType.find(params[:id])
    @clothing_type.update(clothing_type_params)
    redirect_to clothing_types_path
  end

  def destroy
    ClothingType.find(params[:id]).destroy
    redirect_to clothing_types_url
  end

  private
  def clothing_type_params
    params.require(:clothing_type).permit(:name, :description, :unit_price)
  end
end
