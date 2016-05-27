shared_context 'session' do
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