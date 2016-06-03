shared_context 'session' do
  def create_guest_with_course(course_title = 'Sample Course')
    log_in_as_guest
    click_link 'new_course_button'
    find(".subject_container input.ajax_field").set course_title
    page.evaluate_script("$('.subject_container input.ajax_field').blur()")
    expect(page).to have_content(course_title)
  end

  def log_in_as_guest
    visit login_path
    click_on 'Proceed as Guest'
    expect(page).to have_content('Welcome to Skela course tracking!')
    expect(page).to have_content('Click the (+) icon to get started.')
  end
end