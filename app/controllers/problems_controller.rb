class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  
  def index
    @problems = Problem.where(helped: false)
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problems_path
    else
      render :new
    end
  end

  def show
  end

  def update
    @problem.update(helped: true)
    redirect_to root_path
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
