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

end