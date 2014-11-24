class MaterialsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @materials = Material.all.order(:name)
    @material = Material.new
  end

  # show action
  def show
  end

  # new action
  # def new
  #   @material = Material.new
  # end

  # create action
  def create
    @material = Material.new(material_params)
    if @material.save
      flash[:notice] = 'Successfully created material!'
      redirect_to materials_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @material.update_attributes(material_params)
      flash[:notice] = 'Successfully updated material!'
      redirect_to materials_path and return
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @material.destroy
    flash[:notice] = 'Successfully destroyed material.'
    redirect_to materials_path
  end

private

  # find the relevant material from the params
  def set_material
    @material = Material.includes(:products).order('products.product_line_id', 'products.name').find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def material_params
    params.require(:material).permit(:name)
  end

end