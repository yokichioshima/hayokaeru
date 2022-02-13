class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @products = Product.all
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  private
  def order_params
    params.permit(:name, :product_1_id, :product_2_id, :product_3_id, :product_4_id, :product_5_id)
  end
end
