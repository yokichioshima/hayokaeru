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

  private
  def order_params
    params.permit(:name, product_ids: [])
  end
end
