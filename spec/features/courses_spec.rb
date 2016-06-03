require 'spec_helper'

feature 'Courses', js: true do
  include_context 'session'

  context 'New Course' do
    scenario 'create with Title' do
      log_in_as_guest
      click_link 'new_course_button'
      find(".subject_container .ajax_field").set 'Sample Course'
      page.evaluate_script("$('.subject_container input.ajax_field').blur()")
      expect(page).to have_content('Sample Course')
    end
  end

  context 'Existing Course' do
    before(:each) { create_guest_with_course }

    scenario 'update Instructor' do
      find('#course_instructor_add_edit_read .add').click
      expect(page).to have_css('#edit_issue_instructor')
      find('#edit_issue_instructor .ajax_field').set 'Frankenstein'
      page.evaluate_script("$('#edit_issue_instructor .ajax_field').blur()")
      expect(page).to have_content('Frankenstein')
    end

    scenario 'update Instructor Email' do
      find('#course_instructor_email_add_edit_read .add').click
      expect(page).to have_css('#edit_issue_instructor_email')
      find('#edit_issue_instructor_email .ajax_field').set 'frankenstein@university.edu'
      page.evaluate_script("$('#edit_issue_instructor_email .ajax_field').blur()")
      expect(page).to have_content('frankenstein@university.edu')
    end

    scenario 'update Location' do
      find('#course_location_add_edit_read .add').click
      expect(page).to have_css('#edit_issue_location')
      find('#edit_issue_location .ajax_field').set 'Science Building Rm 206'
      page.evaluate_script("$('#edit_issue_location .ajax_field').blur()")
      expect(page).to have_content('Science Building Rm 206')
    end

    scenario 'update Schedule' do
      find('#course_schedule_add_edit_read .add').click
      expect(page).to have_css('#edit_issue_schedule')
      find('#edit_issue_schedule .ajax_field').set 'MWF 1:00-2:30'
      page.evaluate_script("$('#edit_issue_schedule .ajax_field').blur()")
      expect(page).to have_content('MWF 1:00-2:30')
    end
  end
end
