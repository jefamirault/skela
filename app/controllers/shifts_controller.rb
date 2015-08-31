class ShiftsController < ApplicationController

  before_filter :set_shifts
  before_filter :set_shift, only: [:edit, :destroy, :update]

  def index
    @resources = Shift.all

    render 'cards/index'
  end

  def new
    @shift = Shift.create
    render 'cards/new'
  end

  def edit
    render 'cards/edit'
  end

  def update
    sanitize_timezones
    @shift.update(shift_params)
  end

  def destroy
    @shift.destroy
    render 'cards/index'
  end


  private

  def sanitize_timezones
    if params[:shift][:start_time]
      params[:shift][:start_time] = (params[:shift][:start_time].to_datetime + 4.hours).to_s
    end
    if params[:shift][:end_time]
      params[:shift][:end_time] = (params[:shift][:end_time].to_datetime + 4.hours).to_s
    end
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def set_shifts
    @shifts = Shift.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :user_id)
  end
end
