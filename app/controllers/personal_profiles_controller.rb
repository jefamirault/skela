class PersonalProfilesController < ApplicationController
  before_action :set_personal_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @personal_profiles = PersonalProfile.all
    respond_with(@personal_profiles)
  end

  def show
    respond_with(@personal_profile)
  end

  def new
    @personal_profile = PersonalProfile.new
    respond_with(@personal_profile)
  end

  def edit
  end

  def create
    @personal_profile = PersonalProfile.new(personal_profile_params)
    @personal_profile.save
    respond_with(@personal_profile)
  end

  def update
    @personal_profile.update(personal_profile_params)
    respond_with(@personal_profile)
  end

  def destroy
    @personal_profile.destroy
    respond_with(@personal_profile)
  end

  private
    def set_personal_profile
      @personal_profile = PersonalProfile.find(params[:id])
    end

    def personal_profile_params
      params.require(:personal_profile).permit(:name, :favorite_color_id)
    end
end
