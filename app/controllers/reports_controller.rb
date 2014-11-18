class reportsController < ApplicationController

  # before actions
  before_action :authenticate_user!
  before_action :set_report, only: [:show]

  # show action
  def show
  end

  # new action
  def new
    @report = Report.new
  end

  # create action
  def create
    @report = Report.new(report_params)
    if @report.valid?
      session[:report] = @report
      flash[:notice] = 'Successfully created report!'
      redirect_to reports_path and return
    else
      render action: 'new'
    end
  end

  # edit action
  def edit
  end

private

  # find the relevant report from the params
  def set_report
    @report ||= session[:report] ||= Report.new
    @report = Report.new unless @report.valid?
  end

  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'That page does not exist.'
    redirect_to root_path and return
  end

  def report_params
    params.require(:report).permit(:line, :categories, :materials,
      :product_sets, :prices)
  end

end
