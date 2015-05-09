require 'rails_helper'

RSpec.describe "plants/index", :type => :view do
  before(:each) do
    assign(:plants, [
      Plant.create!(
        :name => "Name",
        :species => "Species"
      ),
      Plant.create!(
        :name => "Name",
        :species => "Species"
      )
    ])
  end

  it "renders a list of plants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Species".to_s, :count => 2
  end
end
