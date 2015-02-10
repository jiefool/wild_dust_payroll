class ClothingTypesController < ApplicationController
  before_action :authenticate_user!,
                :set_clothing_type, only:[:edit, :update]  
	def index
    @clothing_types = ClothingType.all
  end

  def new
    @clothing_type = ClothingType.new
  end

  def create
    @clothing_type = ClothingType.new(clothing_type_params)
    @clothing_type.save
    redirect_to clothing_types_path
  end

  def edit    
  end

  def update
    @clothing_type.update(clothing_type_params)
    redirect_to clothing_types_path
  end

  private
  def clothing_type_params
    params.require(:clothing_type).permit(:name, :description, :unit_price)
  end

  def set_clothing_type
    @clothing_type = ClothingType.find(params[:id])
  end
end
