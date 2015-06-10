require 'rails_helper'

RSpec.describe LoginController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new_session" do
    it "returns http success" do
      get :new_session
      expect(response).to have_http_status(:success)
    end
  end

end
