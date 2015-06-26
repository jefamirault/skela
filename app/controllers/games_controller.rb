class GamesController < ApplicationController
  def index
    render 'shared/index'
  end

  def tic_tac_toe
  end

  def plane_of_worlds
    find_or_create_player

    @world = @player.world
    if @player.nil?
      @player = current_user.create_player_account
    end

    find_players

    render layout: 'plane_of_worlds'
  end

  def open_portal
    direction = params[:direction]
    current_player.open_portal direction
  end
  def travel_portal
    current_world = current_player.world
    direction = params[:direction]
    current_player.set_location case direction
      when 'north'
        World.find current_world.portal_1_id
      when 'east'
        World.find current_world.portal_2_id
      when 'south'
        World.find current_world.portal_3_id
      when 'west'
        World.find current_world.portal_4_id
    end
    find_players
  end


  private

  def current_player
    current_user.player
  end
  helper_method :current_player

  def find_or_create_player
    @player = current_user.player ? current_user.player : current_user.create_player_account
    if @player.world.nil?
      @player.world = World.home
    end
  end

  def find_players
    @players = current_player.world.players
    @players.delete current_player
  end
end
