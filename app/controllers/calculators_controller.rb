class CalculatorsController < ApplicationController
  def budget
    @partial = 'budget'
    render 'cards/default'
  end

  def tip
    @partial = 'tip'
    render 'cards/default'
  end

#   scalar (plant food)
#   scientific
#   weighted average / gpa

end
