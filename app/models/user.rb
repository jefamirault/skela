class User < ActiveRecord::Base
  has_secure_password validations: false


  validates_presence_of :password, on: :create


  # attr_accessible :email, :password, :password_confirmation

  def is_superuser?
    self.email == 'Jef'
  end

  validates_uniqueness_of :email
end
