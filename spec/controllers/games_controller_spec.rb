require 'rails_helper'

RSpec.describe GamesController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET tic_tac_toe" do
    it "returns http success" do
      get :tic_tac_toe
      expect(response).to have_http_status(:success)
    end
  end

end
