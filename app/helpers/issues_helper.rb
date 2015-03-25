module IssuesHelper
  def issue_completed_at(issue)
    issue_is_completed = issue.completed
    date_is_known = !!issue.completed_at

    if issue_is_completed
      content = date_is_known ? raw("Resolved<br>(#{time_ago(issue.completed_at)})") : 'Resolved'
      color = 'green'
    else
      content = 'Unresolved'
      color = 'red'
    end

    content_tag :span, content, style: "color:#{color};"
  end
end
