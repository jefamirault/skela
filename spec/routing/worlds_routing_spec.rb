require "rails_helper"

RSpec.describe WorldsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/worlds").to route_to("worlds#index")
    end

    it "routes to #new" do
      expect(:get => "/worlds/new").to route_to("worlds#new")
    end

    it "routes to #show" do
      expect(:get => "/worlds/1").to route_to("worlds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/worlds/1/edit").to route_to("worlds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/worlds").to route_to("worlds#create")
    end

    it "routes to #update" do
      expect(:put => "/worlds/1").to route_to("worlds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/worlds/1").to route_to("worlds#destroy", :id => "1")
    end

  end
end
