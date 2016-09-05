class ProductsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_product ,except: [:index, :create]

  def index
    @products = Category.find(params[:category_id]).products
    @product = Product.new
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.category_id = @category.id
    if @product.save
      redirect_to :back, notice: "product add to category"
    else
      redirect_to :back, alert: "something went wrong"
    end
  end

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to :back, notice: "product updated"
    else
      redirect_to :back, alert: "product not updated"
    end
  end

  def destroy
    if @product.destroy
      redirect_to :back, notice: "product destroyed"
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
