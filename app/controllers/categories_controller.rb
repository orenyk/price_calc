class CategoriesController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @categories = Category.all.order(:name)
    @category = Category.new
  end

  # show action
  def show
  end

  # new action
  # def new
  #   @category = Category.new
  # end

  # create action
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Successfully created category!'
      redirect_to categories_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @category.update_attributes(category_params)
      flash[:notice] = 'Successfully updated category!'
      redirect_to categories_path and return
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @category.destroy
    flash[:notice] = 'Successfully destroyed category.'
    redirect_to categories_path
  end

private

  # find the relevant category from the params
  def set_category
    @category = Category.includes(:products).order('products.product_line_id', 'products.name').find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def category_params
    params.require(:category).permit(:name)
  end

end