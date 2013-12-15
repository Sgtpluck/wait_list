class ApplicationController < ActionController::Base
  before_action :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def adies
    @adies = Adie.all.map do |adie|
      [adie.name, adie.id]
    end
  end

  helper_method :adies

end
