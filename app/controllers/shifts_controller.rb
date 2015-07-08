class ShiftsController < ApplicationController

  before_filter :set_shifts
  before_filter :set_shift, only: [:edit, :destroy, :update]

  def index
    @resources = Shift.all

    render 'shared/index'
  end

  def new
    @shift = Shift.create
    render 'shared/new'
  end

  def edit
    @shift = Shift.find(params[:id])
    render 'shared/edit'
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.update(shift_params)
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    render 'shared/index'
  end


  private

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
