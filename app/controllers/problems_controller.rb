class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy, :report]

  def index
    @problems = Problem.where.not(helped: 'helped')
    @problem = Problem.new
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = current_adie.problems.create(problem_params)

    if @problem.save && Rails.env.production?
      Problem.report(@problem)
      redirect_to '/problems'
    elsif @problem.save
      render :json => {}
    else
      render :new
    end
  end

  def show
    @rating = Rating.new
  end

  def update
    if @problem.helped == 'needs help'
      @problem.update(helped: 'being helped')
    elsif @problem.helped == 'being helped'
      @problem.update(helped: 'helped')
    end
    redirect_to problems_path
  end

  def analysis
    @problems = Problem.where(helped: 'helped')
  end

private

  def set_problem
    @problem=Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:adie_id,
                                    :type,
                                    :description,
                                    :estimate,
                                    :helped)
  end
end
