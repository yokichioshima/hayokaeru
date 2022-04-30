class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :set_material_all, only: [:new, :edit]

    def index
        @products = Product.all
    end

    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            @product.product_materials.each_with_index do |product_material, i|
                product_material.save_single_quantity(product_material, single_quantities_params[:single_quantities][i])
            end
            redirect_to action: :index
        else
            @materials = Material.all
            render :new
        end
    end

    def edit
        @product_materials = ProductMaterial.where(product_id: @product.id)
    end

    def update
        if @product.update(product_params)
            @product.product_materials.each_with_index do |product_material, i|
                product_material.save_single_quantity(product_material, single_quantities_params[:single_quantities][i])
            end
            redirect_to action: :show
        else
            @materials = Material.all
            @product_materials = @product.product_materials
            render :edit
        end
    end

    def destroy
        @product.destroy
        redirect_to action: :index
    end

    private

    def product_params
        params.require(:product).permit(:name, :image, :sort_id, :options, material_ids: [])
    end

    def single_quantities_params
        params.permit(single_quantities: [])
    end

    def set_product
        @product = Product.find(params[:id])
    end

    def set_material_all
        @materials = Material.all
    end
end
