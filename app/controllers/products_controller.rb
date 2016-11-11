class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def inventory
    status = Product.inventory_status(params[:id])
    render plain: status
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render "new"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
