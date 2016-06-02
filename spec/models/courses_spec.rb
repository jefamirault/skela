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
  end
  
end
