class ProductLinesController < ApplicationController
  # before actions
  before_action :authenticate_user!
  before_action :set_product_line, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @product_lines = ProductLine.all.order(:name)
  end

  # show action
  # def show
  # end

  # new action
  def new
    @product_line = ProductLine.new
  end

  # create action
  def create
    @product_line = ProductLine.new(product_line_params)
    if @product_line.save
      flash[:notice] = 'Successfully created product line!'
      redirect_to product_lines_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @product_line.update_attributes(product_line_params)
      flash[:notice] = 'Successfully updated product line!'
      redirect_to product_lines_path and return
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @product_line.destroy
    flash[:notice] = 'Successfully destroyed product line.'
    redirect_to product_lines_path
  end

private

  # find the relevant product line from the params
  def set_product_line
    @product_line = ProductLine.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def product_line_params
    params.require(:product_line).permit(:name)
  end

end