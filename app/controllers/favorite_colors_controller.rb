class FavoriteColorsController < ApplicationController
  before_action :set_favorite_color, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favorite_colors = FavoriteColor.all
    respond_with(@favorite_colors)
  end

  def show
    respond_with(@favorite_color)
  end

  def new
    @favorite_color = FavoriteColor.new
    respond_with(@favorite_color)
  end

  def edit
  end

  def create
    @favorite_color = FavoriteColor.new(favorite_color_params)
    @favorite_color.save
    respond_with(@favorite_color)
  end

  def update
    @favorite_color.update(favorite_color_params)
    respond_with(@favorite_color)
  end

  def destroy
    @favorite_color.destroy
    respond_with(@favorite_color)
  end

  private
    def set_favorite_color
      @favorite_color = FavoriteColor.find(params[:id])
    end

    def favorite_color_params
      params[:favorite_color]
    end
end
