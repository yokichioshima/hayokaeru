class OrdersController < ApplicationController
    before_action :set_order, only: [:edit, :update, :destroy]
    before_action :set_product_all, only: [:new, :edit]

    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
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
        @order.destroy
        redirect_to root_path
    end

    def show_summary
        @orders = Order.includes(products: :materials, products: :product_materials)
    end

    private

    def order_params
        params.require(:order).permit(:name, product_ids: [])
    end

    def set_order
        @order = Order.find(params[:id])
    end

    def set_product_all
        @products = Product.all
    end
end
