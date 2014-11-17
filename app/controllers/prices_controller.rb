class PricesController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @prices = Price.all
  end

  # show action
  # def show
  # end

  # new action
  def new
    @price = Price.new
  end

  # create action
  def create
    @price = Price.new(price_params)
    if @price.save
      flash[:notice] = 'Successfully created price!'
      redirect_to prices_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @price.update_attributes(price_params)
      flash[:notice] = 'Successfully updated price!'
      redirect_to prices_path
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @price.destroy
    flash[:notice] = 'Successfully destroyed price.'
    redirect_to prices_path
  end

private

  # find the relevant price from the params
  def set_price
    @price = Price.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def price_params
    params.require(:price).permit(:name, :cost, :price_type_id)
  end

end
