require 'spec_helper'

feature 'Readings', js: true do
  include_context 'session'

  context 'New Resource' do
    scenario 'Create with Title and Notes' do
      create_guest_with_course 'Math'
      click_on 'View Course'
      expect(page).to have_css('#resources_container')
      page.evaluate_script("$('#new_resource_link').click()")
      find('#resource_title').set 'Math Textbook'
      page.evaluate_script("$('#resource_title').closest('form').submit()")

      page.evaluate_script("$('#resource_url_add_edit_read .add').click()")
      find('#edit_issue_url .ajax_field').set 'Good stuff'
      page.evaluate_script("$('#edit_issue_url .ajax_field').blur()")
      expect(page).to have_content('Good stuff')
    end
  end
end