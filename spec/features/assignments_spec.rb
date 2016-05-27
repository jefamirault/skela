require 'spec_helper'

feature 'Assignments', js: true do
  include_context 'session'

  context 'New Assignment' do
    scenario 'Create with Title' do
      create_guest_with_course 'Math'
      click_on 'Math'
      sleep 1
    end
  end
end