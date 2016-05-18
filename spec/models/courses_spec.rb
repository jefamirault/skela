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

end
