class Plant < ActiveRecord::Base
  def age
    ((Time.now - self.birthday.to_datetime).to_i / 60 / 60 / 24).to_s + ' days'
  end
end
