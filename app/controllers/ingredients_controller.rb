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
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = 'Successfully added ingredient!'
    elsif @ingredient.component.nil?
      flash[:error] = 'Please select a valid component.'
    elsif @ingredient.count < 1
      flash[:error] = 'The component count must be greater than zero.'
    else
      flash[:error] = 'That didn\'t work, please try again.'
    end
    redirect_to @ingredient.product and return
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @ingredient.update_attributes(ingredient_params)
      flash[:notice] = 'Successfully updated ingredient!'
    else
      flash[:error] = 'That didn\'t work, please try again.'
    end
    redirect_to @ingredient.product
  end

  # destroy acton
  def destroy
    @ingredient.destroy
    flash[:notice] = 'Successfully removed ingredient.'
    redirect_to @ingredient.product
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
