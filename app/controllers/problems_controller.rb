class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  
  def index
    if session[:adie_id]
      @problems = Problem.where(helped: false)
    else
      redirect_to '/'
    end
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @problem[:adie_id] = session[:adie_id]
    if @problem.save
      redirect_to "/problems"
    else
      render :new
    end
  end

  def show
  end

  def update
    @problem.update(helped: true)
    redirect_to "/problems"
  end

  def analysis
    @problems = Problem.where(helped: true)
  end

private

  def set_problem
    @problem=Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:adie_id,:type,:description,:estimate,:helped)
  end

end
