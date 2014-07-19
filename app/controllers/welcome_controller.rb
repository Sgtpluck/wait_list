class WelcomeController < ApplicationController
  skip_filter :redirect_if_not_signed_in

  def home
    if current_adie
      redirect_to problems_path
    else
      @adie = Adie.new
    end
  end

  def sign_in
    adie = Adie.find(params[:name])
    if adie && adie.authenticate(params[:password])
      session[:adie_id] = adie.id
      redirect_to "/problems", notice: "You are now signed in!"
    else
      flash[:notice] = "Invalid password :("
      redirect_to '/'
    end
  end

  def sign_out
    session[:adie_id] = nil
    redirect_to root_path, notice: "You have successfully signed out!"
  end

end
