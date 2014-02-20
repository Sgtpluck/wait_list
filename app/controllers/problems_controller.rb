class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy, :report]

  def index
    if current_adie
      @problems = Problem.where.not(helped: 'helped')
    else
      redirect_to root_path
    end
  end

  def new
    if current_adie.ta?
      redirect_to root_path
    else 
      @problem = Problem.new
    end
  end

  def create
    @problem = current_adie.problems.create(problem_params)

    if @problem.save && Rails.env.production?
      Problem.report("#{Adie.find(@problem.adie_id).name} is having a " +
                     "problem with #{@problem.type}. The problem is " +
                     "#{@problem.description}. Estimated time to fix: " +
                     "#{@problem.estimate} -- http://helplist.herokuapp.com/problems")
      redirect_to '/problems'
    elsif @problem.save
      redirect_to '/problems'
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

  def tweet
    @client.update(params[:tweet])
    redirect_to :back, notice: "Your tweet has been successfully posted!"
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

  def set_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CLIENT_ID"]
      config.consumer_secret = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token = current_adie.provider.token
      config.access_token_secret = current_adie.provider.secret
    end
  end

end
