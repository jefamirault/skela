class LogEntry < ActiveRecord::Base
  belongs_to :context
  belongs_to :user

  def user=(user_or_username)
    if user_or_username.class == String
      user = User.find_by_username user_or_username
      if user.nil?
        return false
      else
        super(user)
      end
    else
      super(user_or_username)
    end
  end
end
