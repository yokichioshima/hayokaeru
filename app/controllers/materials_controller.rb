class MaterialsController < ApplicationController
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

  private

  def material_params
    params.permit(:name, :image, :category_id, :price, :options)
  end
end
