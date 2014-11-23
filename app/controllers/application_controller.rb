class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # CUSTOM EXCEPTION HANDLING
  rescue_from StandardError do |e|
    error(e)
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

protected

  def error(e)
    # render :text => "500 Internal Server Error", :status => 500
    # You can render your own template here
    flash[:error] = 'Oops, something went wrong. Please try again.'
    redirect_to root_path and return
  end
end
