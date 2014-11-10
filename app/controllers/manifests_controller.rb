class ManifestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manifest, only: [:show, :edit, :update, :destroy]

  def index
    @manifests = Manifest.all
    respond_with(@manifests)
  end

  def show
    respond_with(@manifest)
  end

  def new
    @manifest = Manifest.new
    respond_with(@manifest)
  end

  def edit
  end

  def create
    manifest_params[:component_id] = params[:component_id]
    @manifest = Manifest.new(manifest_params)
    @manifest.save
    redirect_to @manifest.product and return
  end

  def update
    @manifest.update(manifest_params)
    redirect_to @manifest.product and return
  end

  def destroy
    @manifest.destroy
    respond_with(@manifest)
  end

  private
    def set_manifest
      @manifest = Manifest.find(params[:id])
    end

    def manifest_params
      params.require(:manifest).permit(:product_id, :component_id, :count)
    end
end
