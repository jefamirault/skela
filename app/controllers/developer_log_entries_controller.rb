class DeveloperLogEntriesController < ApplicationController
  before_action :set_developer_log_entry, only: [:show, :edit, :update, :destroy]

  # GET /developer_log_entries
  # GET /developer_log_entries.json
  def index
    @developer_log_entries = DeveloperLogEntry.all
    render 'shared/index'
  end

  # GET /developer_log_entries/1
  # GET /developer_log_entries/1.json
  def show
    render 'shared/show'
  end

  # GET /developer_log_entries/new
  def new
    @developer_log_entry = DeveloperLogEntry.create
    render 'shared/new'
  end

  # GET /developer_log_entries/1/edit
  def edit
    render 'shared/edit'
  end

  # POST /developer_log_entries
  # POST /developer_log_entries.json
  def create
    @developer_log_entry = DeveloperLogEntry.new(developer_log_entry_params)

    respond_to do |format|
      if @developer_log_entry.save
        format.html { redirect_to @developer_log_entry, notice: 'Developer log entry was successfully created.' }
        format.json { render :show, status: :created, location: @developer_log_entry }
      else
        format.html { render :new }
        format.json { render json: @developer_log_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developer_log_entries/1
  # PATCH/PUT /developer_log_entries/1.json
  def update
    respond_to do |format|
      if @developer_log_entry.update(developer_log_entry_params)
        format.js
      end
    end
  end

  # DELETE /developer_log_entries/1
  # DELETE /developer_log_entries/1.json
  def destroy
    @developer_log_entry.destroy
    respond_to do |format|
      format.html { redirect_to developer_log_entries_url, notice: 'Developer log entry was successfully destroyed.' }
      format.json { head :no_content }
    end
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
