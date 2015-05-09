require 'rails_helper'

RSpec.describe "plants/new", :type => :view do
  before(:each) do
    assign(:plant, Plant.new(
      :name => "MyString",
      :species => "MyString"
    ))
  end

  it "renders new plant form" do
    render

    assert_select "form[action=?][method=?]", plants_path, "post" do

      assert_select "input#plant_name[name=?]", "plant[name]"

      assert_select "input#plant_species[name=?]", "plant[species]"
    end
  end
end
