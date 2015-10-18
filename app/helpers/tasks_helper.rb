module TasksHelper
  def task_status(task = @task, plain = false)
    if plain
      link_to update_field_path(task, :complete, !task.complete), class: "task_status plain#{task.status == 'Complete' ? ' complete' : ''}", remote: true, method: :put do
        md_icon('done')
      end
    else
      link_to update_field_path(task, :complete, !task.complete), class: "task_status#{task.status == 'Complete' ? ' complete' : ''}", remote: true, method: :put do
        md_icon('done') + content_tag(:div, task.status, class: 'text')
      end
    end
  end

  def task_assignee(task = @task, select = true)
    content_tag :div, class: 'task_assignee', data: { id: task.id } do
      if task.assignee == 'Unassigned'
        content_tag(:div, nil, style: 'width:32px; height:32px; background: #939598; float:left') +
            content_tag(:div, select ? ajax_user_select(:assignee_id, task) : 'Unassigned', class: 'text', style: 'color: rgba(0,0,0,.6)') +
            content_tag(:div, ajax_user_select(:assignee_id, task), class: 'text', style: 'display:none; color: rgba(0,0,0,.6)')
      else
        image_tag('default_skel', width: 32, height: 32) +
            content_tag(:div, task.assignee, class: 'text', style: 'font-weight: bold;') +
            content_tag(:div, ajax_user_select(:assignee_id, task), class: 'text', style: 'display:none; color: rgba(0,0,0,.6)')
      end
    end
  end

  def task_cards(task, cloaked = false, options = {})
    content_tag :div, class: "task#{cloaked ? ' invisible' : ''}", data: { id: task.id } do
      task_status(task) +
      content_tag(:div, nil, class: 'spacer') +
      task_assignee(task, options[:select]) +
      destroy_link(task, false)
    end
  end

  def update_field_path(record, field, new_value)
    record_path = record.class.to_s.underscore + '_path'
    send(record_path, id: record.id, task: {field => new_value})
  end

  def new_task_for(record)
    link_to 'New Task', issue_new_task_path(record), id: 'new_task', remote: true, method: :post, style: 'opacity: .5; padding: 1em; display:inline-block'
  end
end
