class ComponentCategoriesController < ApplicationController
  before_action :set_component_category, only: [:show, :edit, :update, :destroy]

  def index
    @component_categories = ComponentCategory.all
    respond_with(@component_categories)
  end

  def show
    respond_with(@component_category)
  end

  def new
    @component_category = ComponentCategory.new
    respond_with(@component_category)
  end

  def edit
  end

  def create
    @component_category = ComponentCategory.new(component_category_params)
    @component_category.save
    respond_with(@component_category)
  end

  def update
    @component_category.update(component_category_params)
    respond_with(@component_category)
  end

  def destroy
    @component_category.destroy
    respond_with(@component_category)
  end

  private
    def set_component_category
      @component_category = ComponentCategory.find(params[:id])
    end

    def component_category_params
      params.require(:component_category).permit(:name)
    end
end
