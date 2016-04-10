class SearchController < ApplicationController
  def search
    @assignments = Assignment.ransack params[:q]
    @exams       = Exam.ransack params[:q]
    @readings    = Reading.ransack params[:q]
    @resources   = Resource.ransack params[:q]
  end
end
