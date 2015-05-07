class GamesController < ApplicationController
  def index
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    render 'shared/index'
  end

  def tic_tac_toe
  end

  def plane_of_worlds
    @worlds = World.all
  end
end
