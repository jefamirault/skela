require 'spec_helper'

feature 'Create New Course', js: true do
  scenario 'Guest User' do
    log_in_as_guest
    click_link 'new_course_button'
    find("input.ajax_field.subject").set 'Sample Course'
    page.evaluate_script("$('input.ajax_field.subject').blur()")
    expect(page).to have_content('Sample Course')
  end

  def log_in_as_guest
    visit login_path
    click_on 'Proceed as Guest'
    expect(page).to have_content('Welcome to Skela course tracking!')
    expect(page).to have_content('Click the (+) icon to get started.')
  end
end

feature 'Update Course', js: true do
  scenario 'Guest User' do
    create_guest_with_course('Sample Course Name')
    expect(page).to have_content('Sample Course Name')
    find('#course_instructor_add_edit_read .add').click
    expect(page).to have_css('#edit_issue_instructor')
    find('#edit_issue_instructor .ajax_field').set 'Frankenstein'
    page.evaluate_script("$('#edit_issue_instructor .ajax_field').blur()")
    expect(page).to have_content('Frankenstein')
  end

  def create_guest_with_course(course_title)
    log_in_as_guest
    click_link 'new_course_button'
    find("input.ajax_field.subject").set course_title
    page.evaluate_script("$('input.ajax_field.subject').blur()")
    expect(page).to have_content(course_title)
  end
  def log_in_as_guest
    visit login_path
    click_on 'Proceed as Guest'
    expect(page).to have_content('Welcome to Skela course tracking!')
    expect(page).to have_content('Click the (+) icon to get started.')
  end
end
