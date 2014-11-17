class SetsController < ApplicationController
s  # before actions
  before_action :authenticate_user!
  before_action :set_set, only: [:show, :edit, :update, :destroy]

  # index action
  def index
    @sets = Set.all
  end

  # show action
  def show
  end

  # new action
  def new
    @set = Set.new
  end

  # create action
  def create
    @set = Set.new(set_params)
    if @set.save
      flash[:notice] = 'Successfully created set!'
      redirect_to @set and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

  # update action
  def update
    if @set.update_attributes(set_params)
      flash[:notice] = 'Successfully updated set!'
      redirect_to @set
    else
      render action: 'edit'
    end
  end

  # destroy acton
  def destroy
    @set.destroy
    flash[:notice] = 'Successfully destroyed set.'
    redirect_to sets_path
  end

private

  # find the relevant set from the params
  def set_set
    @set = Set.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def set_params
    params.require(:set).permit(:name)
  end

end