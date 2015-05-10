require 'rails_helper'

RSpec.describe "DeveloperLogEntries", :type => :request do
  describe "GET /developer_log_entries" do
    it "works! (now write some real specs)" do
      get developer_log_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
