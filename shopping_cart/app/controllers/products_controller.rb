class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = 'create product succeed!'
      redirect_to product_path @product
    else
      flash[:fail] = 'create product failed!'
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(product_params)
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image_url)
  end
end
