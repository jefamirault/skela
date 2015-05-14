class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :password, on: :create
  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :courses
  has_many :assignments, through: :courses
  has_many :purchases

  # has_one :avatar

  def username
    read_attribute(:username).downcase
  end
  def username=(value)
    write_attribute(:username, value.downcase)
  end


  def is_superuser?
    self.privilege_level == 1
  end

  def to_s
    self.username
  end
end
