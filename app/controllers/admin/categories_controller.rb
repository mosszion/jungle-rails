class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_index_path, notice: "Category Created!!"
      else
        render :new
      end
    
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
