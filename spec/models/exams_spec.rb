require 'spec_helper'

RSpec.describe 'Exams' do
  before(:each) { @exam = Exam.new }

  it 'should add a resource' do
    resource = Resource.new
    @exam.add_resource resource
    expect(@exam.resources).to include resource
  end

  it 'should add multiple resources' do
    r1 = Resource.new
    r2 = Resource.new
    @exam.add_resources r1, r2
    expect(@exam.resources).to include r1
    expect(@exam.resources).to include r2
  end

  it 'should set title' do
    @exam.title = 'The Data Link Layer'
    expect(@exam.title).to eq 'The Data Link Layer'
  end

  it 'should set notes' do
    @exam.notes = 'Chapter 7: Test Driven Development'
    expect(@exam.notes).to eq 'Chapter 7: Test Driven Development'
  end

  it 'should set date & time' do
    date = Date.today + 1.week
    @exam.date = date
    expect(@exam.date).to eq date

    time = Time.now + 1.hour
    @exam.time = time
    expect(@exam.time).to eq time
  end
end
