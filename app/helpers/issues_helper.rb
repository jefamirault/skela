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

  def issue_status(issue = @issue, status = @issue.status.downcase)
    content_tag :div, id: 'issue_status', class: status do
      case issue.status
        when 'No Task'
          md_icon('add') + content_tag(:div, issue.status, class: 'text')
        when 'Incomplete'
          md_icon('done') + content_tag(:div, 'Incomplete', class: 'text')
        when 'Complete'
          md_icon('done') + content_tag(:div, 'Complete', class: 'text')
      end
    end
  end

  def issue_assignee(issue = @issue)
    content_tag :div, id: 'issue_assignee' do
      if issue.assignee == 'Unassigned'
        content_tag(:div, nil, style: 'width:32px; height:32px; background: #939598; float:left') + content_tag(:div, 'Unassigned', class: 'text', style: 'color: rgba(0,0,0,.6)')
      else
        image_tag('default_skel', width: 32, height: 32) + content_tag(:div, @issue.assignee, class: 'text', style: 'font-weight: bold;')
      end
    end
  end
end
