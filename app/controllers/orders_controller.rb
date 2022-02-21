class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]
  
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @products = Product.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      @products = Product.all
      render :new
    end
  end

  def edit
    @products = Product.all
  end

  def update
    if @order.update(order_params)
      redirect_to root_path
    else
      @products = Product.all
      render :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to root_path
  end

  def tally
    @orders = Order.includes(products: :materials, products: :product_materials)
  end

  private
  def order_params
    params.require(:order).permit(:name, product_ids: [])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
