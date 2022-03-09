class MaterialsController < ApplicationController
  before_action :set_material, only: [:edit, :update, :destroy]

  def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @material.update(material_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @material.destroy
    redirect_to action: :index
  end

  private

  def material_params
    params.require(:material).permit(:name, :image, :category_id, :quantity_unit, :options)
  end

  def set_material
    @material = Material.find(params[:id])
  end
end
