require 'report'

class ReportsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_report, only: [:new, :show]

  # show action
  def show
  end

  # new action
  def new
  end

  # create action
  def create
    # filter products
    @products = Product.all
    # account for empty string passed for missing checkboxes
    pl = report_params[:product_line_ids].reject!(&:empty?)
    ps = report_params[:product_set_ids].reject!(&:empty?)
    c = report_params[:category_ids].reject!(&:empty?)
    m = report_params[:material_ids].reject!(&:empty?)
    @products = @products.where(product_line: pl) unless pl.empty?
    @products = @products.where(product_set: ps) unless ps.empty?
    @products = @products.where(category: c) unless c.empty?
    @products = @products.where(materials: m) unless m.empty?
    binding.pry
    render 'show'
  end

  # destroy action
  def destroy
    session[:report] = nil
    redirect_to new_report_path and return
  end

private

  # find the relevant report from the params
  def set_report
    @report ||= YAML.load(session[:report].to_s)
    unless @report && @report.valid?
      @report = Report.new
      session[:report] = @report.to_yaml
    end
  end

  def report_params
    params.require(:report).permit(:enable_vat, :product_line_ids => [],
      :category_ids => [], :product_set_ids => [], :material_ids => [],
      :price_ids => [])
  end

end
