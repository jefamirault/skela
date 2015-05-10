require 'rails_helper'

RSpec.describe "developer_log_entries/show", :type => :view do
  before(:each) do
    @developer_log_entry = assign(:developer_log_entry, DeveloperLogEntry.create!(
      :title => "Title",
      :text => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
