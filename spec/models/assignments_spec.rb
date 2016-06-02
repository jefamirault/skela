require 'rails_helper'

RSpec.describe 'Assignments' do
  before(:each) { @assignment = Assignment.new }

  it 'should add a resource' do
    resource = Resource.new
    @assignment.add_resource resource
    expect(@assignment.resources).to include resource
  end

  it 'should add multiple resources' do
    r1 = Resource.new
    r2 = Resource.new
    @assignment.add_resources r1, r2
    expect(@assignment.resources).to include r1
    expect(@assignment.resources).to include r2
  end

  it 'should set notes' do
    @assignment.notes = 'Chapter 7: Test Driven Development'
    expect(@assignment.notes).to eq 'Chapter 7: Test Driven Development'
  end

  it 'should set date' do
    date = Date.today + 1.week
    @assignment.date = date
    expect(@assignment.date).to eq date
  end
end
