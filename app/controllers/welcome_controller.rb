class WelcomeController < ApplicationController

  def home
    @adie = Adie.new
  end

  def sign_in
    adie = Adie.find_by(name: params[:name])
    if adie && adie.authenticate(params[:password])
      session[:adie] = adie.name
      redirect_to "/problems", notice: "You are now signed in!"
    else
      render :home, notice: "Invalid password :("
    end
  end

  def sign_out
    session[:adie] = nil
    redirect_to root_path, notice: "You have successfully signed out!"
  end

end
