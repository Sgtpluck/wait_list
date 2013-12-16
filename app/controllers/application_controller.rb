class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # def adies
  #   @adies = Adie.all.map do |adie|
  #     [adie.name, adie.id]
  #   end
  # end

  # helper_method :adies

end
