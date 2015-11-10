require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do

  describe "GET #budget" do
    it "returns http success" do
      get :budget
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tip" do
    it "returns http success" do
      get :tip
      expect(response).to have_http_status(:success)
    end
  end

end
