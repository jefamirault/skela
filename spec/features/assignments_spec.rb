require 'spec_helper'

feature 'Assignments', js: true do
  include_context 'session'

  context 'New Assignment' do
    scenario 'Create with Title and Notes' do
      create_guest_with_course 'Math'
      click_on 'View Course'
      expect(page).to have_css('#assignments_container')
      page.evaluate_script("$('#new_assignment_link').click()")
      find('#assignment_title').set 'Homework 1'
      page.evaluate_script("$('#assignment_title').closest('form').submit()")

      # page.evaluate_script("$('#assignment_date_add_edit_read .add').click()")
      # expect(page).to have_css('#edit_issue_date')
      # TODO Fix problem testing date inputs
      # page.evaluate_script("$('#edit_issue_date .ajax_field').val('05/24/16')")
      # page.evaluate_script("$('#edit_issue_date').submit()")

      page.evaluate_script("$('#assignment_notes_add_edit_read .add').click()")
      find('#edit_issue_notes .ajax_field').set 'Problem #42 is extra credit'
      page.evaluate_script("$('#edit_issue_notes .ajax_field').blur()")
      expect(page).to have_content('Problem #42 is extra credit')
    end
  end
end