class ProductSetsController < ApplicationController
  # before actions
  before_action :authenticate_user!
  before_action :set_product_set, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @product_sets = ProductSet.all
  end

  # show action
  def show
  end

  # new action
  def new
    @product_set = ProductSet.new
  end

  # create action
  def create
    @product_set = ProductSet.new(product_set_params)
    if @product_set.save
      flash[:notice] = 'Successfully created product_set!'
      redirect_to @product_set and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @product_set.update_attributes(product_set_params)
      flash[:notice] = 'Successfully updated product_set!'
      redirect_to @product_set
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @product_set.destroy
    flash[:notice] = 'Successfully destroyed product_set.'
    redirect_to product_sets_path
  end

private

  # find the relevant product set from the params
  def set_product_set
    @product_set = ProductSet.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def product_set_params
    params.require(:product_set).permit(:name)
  end

end