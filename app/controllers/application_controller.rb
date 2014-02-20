class ApplicationController < ActionController::Base
  before_action :current_adie
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_adie
    @current_adie || Adie.find(session[:adie_id]) if session[:adie_id]
  rescue ActiveRecord::RecordNotFound
    session[:adie_id] = nil
    redirect_to root_path
  end
  helper_method :current_adie
end
