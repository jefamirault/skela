require 'spec_helper'

RSpec.describe 'Readings' do
  before(:each) { @reading = Reading.new }

  it 'should add a resource' do
    resource = Resource.new
    @reading.add_resource resource
    expect(@reading.resources).to include resource
  end

  it 'should add multiple resources' do
    r1 = Resource.new
    r2 = Resource.new
    @reading.add_resources r1, r2
    expect(@reading.resources).to include r1
    expect(@reading.resources).to include r2
  end

  it 'should set notes' do
    @reading.notes = 'Chapter 7: Test Driven Development'
    expect(@reading.notes).to eq 'Chapter 7: Test Driven Development'
  end

  it 'should set date' do
    date = Date.today + 1.week
    @reading.date = date
    expect(@reading.date).to eq date
  end
end
