class StatusController < ApplicationController
  layout false

  def index
    @problems = Problem.where.not(helped: 'helped')
  end
end