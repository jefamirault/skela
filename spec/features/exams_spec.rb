require 'spec_helper'

feature 'Exams', js: true do
  include_context 'session'

  context 'New Exam' do
    scenario 'Create with Title and Notes' do
      create_guest_with_course 'Math'
      click_on 'View Course'
      expect(page).to have_css('#exams_container')
      page.evaluate_script("$('#new_exam_link').click()")
      find('#exam_title').set 'Homework 1'
      page.evaluate_script("$('#exam_title').closest('form').submit()")

      # page.evaluate_script("$('#exam_date_add_edit_read .add').click()")
      # expect(page).to have_css('#edit_issue_date')
      # TODO Fix problem testing date inputs
      # page.evaluate_script("$('#edit_issue_date .ajax_field').val('05/24/16')")
      # page.evaluate_script("$('#edit_issue_date').submit()")

      # page.evaluate_script("$('#exam_time_add_edit_read .add').click()")
      # expect(page).to have_css('#edit_issue_time')
      # TODO Fix problem testing time inputs
      # page.evaluate_script("$('#edit_issue_time .ajax_field').val('12:00 PM')")
      # page.evaluate_script("$('#edit_issue_time').submit()")

      page.evaluate_script("$('#exam_location_add_edit_read .add').click()")
      find('#edit_issue_location .ajax_field').set 'Bartlett 65'
      page.evaluate_script("$('#edit_issue_location .ajax_field').blur()")
      expect(page).to have_content('Bartlett 65')

      page.evaluate_script("$('#exam_notes_add_edit_read .add').click()")
      find('#edit_issue_notes .ajax_field').set 'Problem #42 is extra credit'
      page.evaluate_script("$('#edit_issue_notes .ajax_field').blur()")
      expect(page).to have_content('Problem #42 is extra credit')
    end
  end
end