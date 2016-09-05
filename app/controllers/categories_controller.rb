class CategoriesController < ApplicationController
  
  before_action :authenticate_user!

  def index
  	@categories = Category.all
  	@category = Category.new
  end

  def create
  	@category = current_user.categories.new(categoty_params)
  	if @category.save
  		redirect_to :back, notice: "Category successfuly saved :)"
  	else
  		redirect_to :back, alert: "Validation failed :("
  	end
  end

  private

  def categoty_params
		params.require(:category).permit(:title)
	end
end
