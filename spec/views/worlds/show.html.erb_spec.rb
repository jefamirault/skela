require 'rails_helper'

RSpec.describe "worlds/show", :type => :view do
  before(:each) do
    @world = assign(:world, World.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
