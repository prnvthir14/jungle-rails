class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with :name => "Jungle", :password => "book"

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  def destroy
    @categories = Category.find params[:id]
    @categories.destroy
    redirect_to [:admin, :categories], notice: 'category deleted!'
  end

  private

  def categories_params
    params.require(:category).permit(
      :name,
      :category_id,

    )
  end

end
