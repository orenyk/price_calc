class IngredientsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @ingredients = Ingredient.all
  end

  # show action
  def show
  end

  # new action
  def new
    @ingredient = Ingredient.new
  end

  # create action
  def create
    # check for existing ingredient with that component and product
    prod = ingredient_params[:product_id]
    comp = ingredient_params[:component_id]
    other_ing = Ingredient.where("product_id = ? AND component_id = ?",
      prod ? prod : 0, comp ? comp : 0)
    # if it exists, replace @ingredient and simply increment the count
    if other_ing.first && ingredient_params[:count].to_i > 0
      @ingredient = other_ing.first
      @ingredient.count += ingredient_params[:count].to_i
    # otherwise, create a new ingredient
    else
      @ingredient = Ingredient.new(ingredient_params)
    end
    # now try to save
    if @ingredient.save
      flash[:notice] = 'Successfully added component!'
    elsif @ingredient.component.nil?
      flash[:error] = 'Please select a valid component.'
    elsif @ingredient.count < 1
      flash[:error] = 'The component count must be greater than zero.'
    else
      flash[:error] = 'That didn\'t work, please try again.'
    end
    redirect_to product_path(@ingredient.product), status: 303 and return
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @ingredient.update_attributes(ingredient_params)
      flash[:notice] = 'Successfully updated component!'
    else
      flash[:error] = 'That didn\'t work, please try again.'
    end
    binding.pry
    redirect_to product_path(@ingredient.product), status: 303
  end

  # destroy acton
  def destroy
    @ingredient.destroy
    flash[:notice] = 'Successfully removed component.'
    respond_to do |format|
      format.html { redirect_to product_path(@ingredient.product), status: 303 }
      format.js { render :js => "window.location.href = '#{product_path(@ingredient.product)}'" }
    end
  end

private

  # find the relevant ingredient from the params
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def ingredient_params
    params.require(:ingredient).permit(:product_id, :component_id, :count)
  end

end
