class OrdersController < ApplicationController
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
      redirect_to action: :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    @products = Product.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to root_path
  end

  def tally
    @orders = Order.includes(products: :materials)
  end

  private
  def order_params
    params.permit(:name, product_ids: [])
  end
end
