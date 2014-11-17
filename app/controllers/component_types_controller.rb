class ComponentTypesController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_component_type, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @component_types = ComponentType.all
  end

  # show action
  # def show
  # end

  # new action
  def new
    @component_type = ComponentType.new
  end

  # create action
  def create
    @component_type = ComponentType.new(component_type_params)
    if @component_type.save
      flash[:notice] = 'Successfully created component type!'
      redirect_to component_types_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @component_type.update_attributes(component_type_params)
      flash[:notice] = 'Successfully updated component type!'
      redirect_to component_types_path and return
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @component_type.destroy
    flash[:notice] = 'Successfully destroyed component type.'
    redirect_to component_types_path
  end

private

  # find the relevant component type from the params
  def set_component_type
    @component_type = ComponentType.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def component_type_params
    params.require(:component_type).permit(:name)
  end

end