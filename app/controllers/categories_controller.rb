class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  # private
  # def category_params
  #     params.require(:category).permit(:name)
  # end
end
