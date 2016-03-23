class UserPresenter
  include ActionView::Helpers
  include ActionView::Context


  def initialize(user = nil, template = nil)
    @user = user
    @template = template
  end

  def username
    content_tag :div, id: 'current_user' do
      content_tag(:strong, content_tag(:span, "#{@user.username}", class: "user_#{@user.id}_username"))
    end
  end

  def avatar
    size = 72
    path = (@user.nil? ? Avatar.default : (@user.avatar ? @user.avatar.path : Avatar.default))
    tag('img', src: "assets/#{path}", class: 'avatar', style: "width:#{size}px;height:#{size}px;")
  end

  def username_and_avatar
    # klass = 'nav_link'
    # klass << ' selected' if params[:controller] == 'users' && params[:action] == 'my_profile'
    # link_to my_profile_path, remote: true, class: klass, data: { fade_content: true, swap_title: 'My Profile' } do
    #   username + avatar
    # end
    username + avatar
  end
end
