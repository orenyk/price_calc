class ProductsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @products = Product.includes(:product_line, :product_set).order('product_lines.name', 'product_sets.name', 'products.name').all
    @product = Product.new
  end

  # show action
  def show
    @ingredients = @product.ingredients.includes(:component)
    @new_ingredient = Ingredient.new
    @prices = Price.all.order(:multiple)
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
    @product.destroy
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
    params.require(:product).permit(:name, :category_id, :product_line_id,
      :product_set_id, :material_id)
  end

end
