class ApplicationController < ActionController::Base
  before_action :redirect_if_not_signed_in
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_adie
    @current_adie || Adie.find(session[:adie_id]) if session[:adie_id]
  rescue ActiveRecord::RecordNotFound
    session[:adie_id] = nil
    redirect_to root_path
  end
  helper_method :current_adie, :redirect_if_not_signed_in

  def redirect_if_not_signed_in
    redirect_to root_path unless current_adie
  end
end
