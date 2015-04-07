class GamesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def tic_tac_toe
  end
end
