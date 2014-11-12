class ProductsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @products = Product.all
  end

  # show action
  def show
    @ingredients = @product.ingredients
    @new_ingredient = Ingredient.new
  end

  # new action
  def new
    @product = Product.new
  end

  # create action
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Successfully created product!'
      redirect_to @product and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @product.update_attributes(product_params)
      flash[:notice] = 'Successfully updated product!'
      redirect_to @product
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @product.destory
    flash[:notice] = 'Successfully destroyed product.'
    redirect_to products_path
  end

private

  # find the relevant product from the params
  def set_product
    @product = Product.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def product_params
    params.require(:product).permit(:name, :line, :category_id, :family_id,
      :material_id)
  end

end