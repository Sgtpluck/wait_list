class StatusController < ApplicationController
  def index
    @problems = Problem.where.not(helped: 'helped')
  end
end