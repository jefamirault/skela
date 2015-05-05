require 'rails_helper'

RSpec.describe "worlds/index", :type => :view do
  before(:each) do
    assign(:worlds, [
      World.create!(),
      World.create!()
    ])
  end

  it "renders a list of worlds" do
    render
  end
end
