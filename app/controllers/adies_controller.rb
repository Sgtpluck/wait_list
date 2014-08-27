class AdiesController < ApplicationController
  skip_filter :redirect_if_not_signed_in, only: [:new_password]
  require 'csv'

  def index
    @adies = Adie.where(current: true)
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
      redirect_to '/problems'
    else
      render :new
    end
  end

  def show
    @adie = Adie.find(session[:adie_id])
  end

  def update
    @adie = current_adie
    @adie.update(adie_params)
    if @adie.save
      flash[:notice] = "Thanks for updating your info!"
      render :json => { password: @adie.password }
    else
      render :json => { :message => @adie.errors.full_messages }, status: 400
    end
  end

  def new_password
    adie = Adie.where(email: params[:adie][:email]).first
    if adie
      adie.create_random_password
      render :json => {}, status: 200
    else
      render :json => {}, status: 400  
    end
  end

  def bulk_upload
    Adie.bulk_upload(params['adies'])
  end

  private

  def adie_params
    params.require(:adie).permit(:name,
                                 :password,
                                 :password_confirmation,
                                 :adatar,
                                 :ta,
                                 :email,
                                 :current)
  end

end
