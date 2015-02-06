class User < ActiveRecord::Base
  has_secure_password validations: false

  validates_presence_of :password, on: :create

  def is_superuser?
    self.email == 'Jef'
  end
  def is_superuser?
    privelage_level == 1
  end

  validates_uniqueness_of :email
end
