class SearchController < ApplicationController
  def search
    ftext = params[:ftext] || ''
    @q = { course_user_id_eq: current_user.id, }
    assignments = Assignment.ransack(@q.merge(title_or_notes_cont: ftext )).result
    exams       = Exam.ransack(@q.merge(title_or_notes_cont: ftext )).result
    readings    = Reading.ransack(@q.merge(topic_or_notes_cont: ftext )).result
    resources   = Resource.ransack(@q.merge(title_cont: ftext )).result

    @groups = {
        assignments: assignments,
        exams:       exams,
        readings:    readings,
        resources:   resources
    }
    # binding.pry
    if params[:focus]
      @groups = { params[:focus].to_sym => @groups[params[:focus].to_sym] }
    end
  end
end
