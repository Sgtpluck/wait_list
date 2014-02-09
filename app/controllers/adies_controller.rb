class AdiesController < ApplicationController

  def index
    if session[:adie_id]
      @adies = Adie.all
    else
      redirect_to '/', notice: "Please sign in to view the Adies or create a problem."
    end
  end

  def new
    @admin = Adie.find(session[:adie_id])
    if @admin.admin == true
      @adie = Adie.new
    else
      redirect_to problems_path
    end
  end

  def create
    @adie = Adie.new(adie_params)
    if @adie.save
      redirect_to 'problems'
    else
      render :new
    end
  end

  def show
    @adie = Adie.find(session[:adie_id])
  end

  def update
    @adie = Adie.find(session[:adie_id])
    if @adie.update(adie_params)
      flash[:notice] = "Your password was successfully updated!"
      redirect_to problems_path
    else
      puts @adie.errors.inspect
      render :show
    end
  end

  private

  def adie_params
    params.require(:adie).permit(:name,
                                 :password,
                                 :password_confirmation,
                                 :adatar,
                                 :ta)
  end

end
