require "rails_helper"

RSpec.describe DeveloperLogEntriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/developer_log_entries").to route_to("developer_log_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/developer_log_entries/new").to route_to("developer_log_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/developer_log_entries/1").to route_to("developer_log_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/developer_log_entries/1/edit").to route_to("developer_log_entries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/developer_log_entries").to route_to("developer_log_entries#create")
    end

    it "routes to #update" do
      expect(:put => "/developer_log_entries/1").to route_to("developer_log_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/developer_log_entries/1").to route_to("developer_log_entries#destroy", :id => "1")
    end

  end
end
