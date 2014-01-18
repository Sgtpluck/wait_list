class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy, :report]

  def index
    if session[:adie_id]
      @problems = Problem.where.not(helped: 'helped')
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
      # Commented out for development purposes.
      # Problem.report("#{Adie.find(@problem.adie_id).name} is having a " +
      #                "problem with #{@problem.type}. The problem is " +
      #                "#{@problem.description}. Estimated time to fix: " +
      #                "#{@problem.estimate} -- http://helplist.herokuapp.com/problems")
      redirect_to '/problems'
    else
      render :new
    end
  end

  def show
  end

  def update
    if @problem.helped == 'needs help'
      @problem.update(helped: 'being helped')
    elsif @problem.helped == 'being helped'
      @problem.update(helped: 'helped')
    end
<<<<<<< HEAD
    redirect_to problems_path
=======

    redirect_to '/problems'
>>>>>>> f4899bb70b7a6b2d2092a6b101a3787e20250e3e
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
