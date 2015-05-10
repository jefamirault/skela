require 'rails_helper'

RSpec.describe "developer_log_entries/index", :type => :view do
  before(:each) do
    assign(:developer_log_entries, [
      DeveloperLogEntry.create!(
        :title => "Title",
        :text => "MyText",
        :user_id => 1
      ),
      DeveloperLogEntry.create!(
        :title => "Title",
        :text => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of developer_log_entries" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
