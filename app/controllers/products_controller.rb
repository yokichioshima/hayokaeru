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
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @materials = Material.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: :show
    else
      redirect_to action: :edit
    end
  end

  def destroy
  end

  private

  def product_params
    params.permit(:name, :image, :sort_id, :options, material_ids: [], single_quantities: [])
  end

  def single_quantities_pamams
    params.permit(single_quantities: [])
  end
end
