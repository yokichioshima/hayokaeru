class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def create
  end

  private

  def material_params
    params.require(:material).permit(:name, :image, :category_id, :price, :options).merge()
end
