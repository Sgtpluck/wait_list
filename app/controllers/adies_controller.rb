class AdiesController < ApplicationController

  http_basic_authenticate_with name: "Sgt Pluck", password: "suchpassword"

  def index
    @adies = Adie.all
  end
  
  def new
    @adie = Adie.new
  end

  def create
    @adie = Adie.new(adie_params)
    if @adie.save
      redirect_to adies_path
    else
      flash[:notice] = "This Adie could not be saved"
      render :new
    end
  end

  private

  def adie_params
    params.require(:adie).permit(:name, :password, :password_confirmation) #:adatar
  end

end
