class FamiliesController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @families = Family.all
  end

  # show action
  def show
  end

  # new action
  def new
    @family = Family.new
  end

  # create action
  def create
    @family = Family.new(family_params)
    if @family.save
      flash[:notice] = 'Successfully created family!'
      redirect_to @family and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @family.update_attributes(family_params)
      flash[:notice] = 'Successfully updated family!'
      redirect_to @family
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @family.destroy
    flash[:notice] = 'Successfully destroyed family.'
    redirect_to familys_path
  end

private

  # find the relevant family from the params
  def set_family
    @family = Family.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def family_params
    params.require(:family).permit(:name)
  end

end