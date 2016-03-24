class UserPresenter
  include ActionView::Helpers
  include ActionView::Context


  def initialize(user = nil, template = nil)
    @user = user
    @template = template
  end

  def username
    content_tag :div, id: 'current_user' do
      content_tag(:strong, content_tag(:span, "#{@user ? @user.username : 'Guest'}", class: "user_#{@user ? @user.id : 0}_username"))
    end
  end

  def avatar
    size = 72
    path = (@user.nil? ? Avatar.default : (@user.avatar ? @user.avatar.path : Avatar.default))
    tag('img', src: "assets/#{path}", class: 'avatar', style: "width:#{size}px;height:#{size}px;")
  end

  def username_and_avatar
    username + avatar
  end
end
