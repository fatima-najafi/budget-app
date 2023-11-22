class CategoriesController < ApplicationController
   def index
    @categories = Category.includes(:exchanges, :author).where(author: current_user)
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
