class SearchController < ApplicationController
  def search
    ftext = params[:ftext] || ''
    @q = {
        course_user_id_eq: current_user.id,
        date_eq:           params[:date] ? params[:date].to_date : nil,
        title_cont:        params[:title],
        notes_cont:        params[:notes]
    }


    fields = {
        assignment: { ftext: :title_or_notes },
        exam:       { ftext: :title_or_notes },
        reading:    { ftext: :title_or_notes },
        resource:   { ftext: :title_or_url }
    }

    queries = fields.map do |type, fields|
      { type => @q.merge("#{fields[:ftext]}_cont" => ftext) }
    end.reduce :merge

    @groups = queries.map do |type, query|
      model = type.to_s.titleize.constantize
      { type.to_s.pluralize.to_sym => model.ransack(query).result }
    end.reduce :merge

    if params[:focus]
      @groups = { params[:focus].to_sym => @groups[params[:focus].to_sym] }
    end
    if params[:date].present?
      @groups.delete :resources
    end

  end
end
