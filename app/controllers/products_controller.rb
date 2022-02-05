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
    binding.pry
    if @product.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def product_params
    params.permit(:name, :image, :sort_id, :options, material_ids: [], single_quantities: [])
  end
end
