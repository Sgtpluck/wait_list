class AdiesController < ApplicationController

  http_basic_authenticate_with name: "Sgt Pluck", password: "suchpassword", except: [:show, :update]

  def index
    if session[:adie_id]
      @adies = Adie.all
    else
      redirect_to '/', notice: "Please sign in to view the Adies or create a problem."
    end
  end

  def new
    @adie = Adie.new
  end

  def create
    @adie = Adie.new(adie_params)
    if @adie.save
      redirect_to 'problems'
    else
      flash[:notice] = "This Adie could not be saved"
      render :new
    end
  end

  def show
    @adie = Adie.find(session[:adie_id])
  end

  def update
    @adie = Adie.find(session[:adie_id])
    # @adie[:adatar] = @adie[:adatar]
    # @adie[:name] = session[:adie]
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
                                 :adatar)
  end

end
