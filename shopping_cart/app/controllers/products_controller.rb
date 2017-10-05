class ProductsController < ApplicationController

  def index
    @products = Product.find_products
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
      flash[:warning] = 'create product failed!'
      render 'new'
    end
  end

  def show
    @product = Product.find(params_id)
  end
 
  def edit
    @product = Product.find(params_id)
  end

  def update
    @product = Product.find(params_id)
    if @product.update(product_params)
      flash[:success] = 'update product succeed!'
      redirect_to product_path @product
    else
      flash[:warning] = 'update product failed!'
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params_id)
    @product.destroy
    flash[:success] = 'delete product succeed!'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def params_id
    params[:id]
  end
end
