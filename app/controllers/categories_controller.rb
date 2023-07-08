class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = @user.categories
  end

  def new
    @user = current_user
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)
    if @category.save
      redirect_to user_categories_path(@user), notice: 'Category created successfully!'
    else
      puts @category.errors.full_messages
      render :new
    end
  end

  def show; end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
