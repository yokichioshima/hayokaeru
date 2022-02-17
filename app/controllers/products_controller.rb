class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @materials = Material.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @product.product_materials.each_with_index do |product_material, i|
        product_material.single_quantity = single_quantities_params[:single_quantities][i]
        product_material.save
      end
      redirect_to action: :index
    else
      @materials = Material.all
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @materials = Material.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      @product.product_materials.each_with_index do |product_material, i|
        product_material.single_quantity = single_quantities_params[:single_quantities][i]
        product_material.save
      end
      redirect_to action: :show
    else
      @materials = Material.all
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to action: :index
  end

  private

  def product_params
    params.require(:product).permit( :name, :image, :sort_id, :options, material_ids: [])
  end

  def single_quantities_params
    params.permit(single_quantities: [])
  end
end
