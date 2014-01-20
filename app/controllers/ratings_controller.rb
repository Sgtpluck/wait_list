class RatingsController < ApplicationController

  def create
    @problem = Problem.find(params[:rating][:problem_id])
    @rating = Rating.new(rating_params)
    @rating[:problem_id] = @problem.id
    if @rating.save
      redirect_to problem_path(@problem.id)
    else
      redirect_to :back
    end
  end

private
  
  def rating_params
    params.require(:rating).permit(:helper,
                                   :rating,
                                   :solution,
                                   :satisfaction,
                                   :problem_id)
  end

end
