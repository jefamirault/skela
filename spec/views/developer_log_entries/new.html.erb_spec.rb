require 'rails_helper'

RSpec.describe "developer_log_entries/new", :type => :view do
  before(:each) do
    assign(:developer_log_entry, DeveloperLogEntry.new(
      :title => "MyString",
      :text => "MyText",
      :user_id => 1
    ))
  end

  it "renders new developer_log_entry form" do
    render

    assert_select "form[action=?][method=?]", developer_log_entries_path, "post" do

      assert_select "input#developer_log_entry_title[name=?]", "developer_log_entry[title]"

      assert_select "textarea#developer_log_entry_text[name=?]", "developer_log_entry[text]"

      assert_select "input#developer_log_entry_user_id[name=?]", "developer_log_entry[user_id]"
    end
  end
end
