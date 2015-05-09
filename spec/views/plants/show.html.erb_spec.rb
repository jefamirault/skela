require 'rails_helper'

RSpec.describe "plants/show", :type => :view do
  before(:each) do
    @plant = assign(:plant, Plant.create!(
      :name => "Name",
      :species => "Species"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Species/)
  end
end
