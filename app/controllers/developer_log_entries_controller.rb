class DeveloperLogEntriesController < ApplicationController
  before_action :set_developer_log_entry, only: [:show, :edit, :update, :destroy]

  def index
    @developer_log_entries = DeveloperLogEntry.all
    render 'cards/index'
  end

  def show
    render 'cards/show'
  end

  def new
    @developer_log_entry = DeveloperLogEntry.create
    render 'cards/new'
  end

  def edit
    render 'cards/edit'
  end

  def update
    @developer_log_entry.update(developer_log_entry_params)
    render nothing: true
  end

  def destroy
    @developer_log_entry.destroy
    @developer_log_entries = DeveloperLogEntry.all
    render 'cards/index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer_log_entry
      @developer_log_entry = DeveloperLogEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_log_entry_params
      params.require(:developer_log_entry).permit(:title, :text, :datetime, :user)
    end
end
