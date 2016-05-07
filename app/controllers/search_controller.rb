class SearchController < ApplicationController
  def search
    ftext = params[:ftext] || ''
    @q = {
        course_user_id_eq: current_user.id,
        date_eq:           params[:date] ? params[:date].to_date : nil,
        title_cont:        params[:title],
        notes_cont:        params[:notes]
    }

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

    if params[:focus]
      @groups = { params[:focus].to_sym => @groups[params[:focus].to_sym] }
    end
    
    if params[:date].present?
      @groups.delete :resources
    end

  end
end
