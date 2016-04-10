class SearchController < ApplicationController
  def search
    ftext = params[:ftext] || ''
    @q = { course_user_id_eq: current_user.id, }
    @assignments = Assignment.ransack(@q.merge(title_or_description_cont: ftext )).result
    @exams       = Exam.ransack(@q.merge(topic_or_description_cont: ftext )).result
    @readings    = Reading.ransack(@q.merge(topic_or_description_cont: ftext )).result
    @resources   = Resource.ransack(@q.merge(description_cont: ftext )).result
  end
end
