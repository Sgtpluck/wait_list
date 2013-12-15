class AdiesController < ApplicationController
  def index
    @adies = Adie.all
  end
  
  def new
    @adie = Adie.new
  end

  def create
    @adie = Adie.new(adie_params)
    if @adie.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def adie_params
    params.require(:adie).permit(:name,:adatar)
  end

end
