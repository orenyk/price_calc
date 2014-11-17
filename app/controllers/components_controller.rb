class ComponentsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @components = Component.all
  end

  # show action
  # def show
  # end

  # new action
  def new
    @component = Component.new
  end

  # create action
  def create
    @component = Component.new(component_params)
    if @component.save
      flash[:notice] = 'Successfully created component!'
      redirect_to components_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @component.update_attributes(component_params)
      flash[:notice] = 'Successfully updated component!'
      redirect_to components_path
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @component.destroy
    flash[:notice] = 'Successfully destroyed component.'
    redirect_to components_path
  end

private

  # find the relevant component from the params
  def set_component
    @component = Component.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def component_params
    params.require(:component).permit(:name, :cost, :component_type_id)
  end

end
