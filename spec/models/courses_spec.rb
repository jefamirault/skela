require 'rails_helper'

RSpec.describe 'Courses' do

  describe 'Attributes' do
    before(:each) { @course = Course.new }

    it 'should set course title' do
      @course.title = 'Data Science'
      expect(@course.title).to eq 'Data Science'
    end
    it 'should set instructor' do
      @course.instructor = 'David Jensen'
      expect(@course.instructor).to eq 'David Jensen'
    end
    it 'should set course number' do
      @course.number = 'COMPSCI348'
      expect(@course.number).to eq 'COMPSCI348'
    end
    it 'should set location' do
      @course.location = 'Engineering Lab 304'
      expect(@course.location).to eq 'Engineering Lab 304'
    end
    it 'should set meeting schedule' do
      @course.schedule= 'TuTh 1:00-2:15'
      expect(@course.schedule).to eq 'TuTh 1:00-2:15'
    end
  end

  describe 'Readings' do
    before(:each) do
      @course = Course.new
      @reading = Reading.new
      @course.add_reading @reading
    end

    it 'should be added to course' do
      expect(@course.readings).to include @reading
    end

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

    it 'should set description' do
      @reading.description = 'Chapter 7: Test Driven Development'
      expect(@reading.description).to eq 'Chapter 7: Test Driven Development'
    end

    it 'should set due date' do
      due = Date.today + 1.week
      @reading.due_date = due
      expect(@reading.due_date).to eq due
    end
  end

  describe 'Assignments' do
    before(:each) do
      @course = Course.new
      @assignment = Assignment.new
      @course.add_assignment @assignment
    end

    it 'should be added to course' do
      expect(@course.assignments).to include @assignment
    end

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

    it 'should set description' do
      @assignment.description = 'Chapter 7: Test Driven Development'
      expect(@assignment.description).to eq 'Chapter 7: Test Driven Development'
    end

    it 'should set due date' do
      due = Date.today + 1.week
      @assignment.due_date = due
      expect(@assignment.due_date).to eq due
    end
  end

  describe 'Exams' do
    before(:each) do
      @course = Course.new
      @exam = Exam.new
      @course.add_exam @exam
    end

    it 'should be added to course' do
      expect(@course.exams).to include @exam
    end

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

    it 'should set topic' do
      @exam.topic = 'The Data Link Layer'
      expect(@exam.topic).to eq 'The Data Link Layer'
    end

    it 'should set description' do
      @exam.description = 'Chapter 7: Test Driven Development'
      expect(@exam.description).to eq 'Chapter 7: Test Driven Development'
    end

    it 'should set date & time' do
      due = Time.now + 1.week
      @exam.datetime = due
      expect(@exam.datetime).to eq due
    end
  end

end
