class StatusController < ApplicationController
  skip_filter :redirect_if_not_signed_in
  layout 'statusboard'

  def index
    @problems = Problem.where.not(helped: 'helped')
  end
end