class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :password, on: :create,
                        unless: Proc.new { |a| a.is_guest }
  validates_presence_of :username,
                        unless: Proc.new { |a| a.is_guest }
  validates_uniqueness_of :username

  has_many :courses
  has_many :assignments, through: :courses
  has_many :exams, through: :courses
  has_many :readings, through: :courses
  has_many :resources, through: :courses

  has_one :avatar

  def username
    database_says = read_attribute(:username)
    database_says ? database_says.downcase : nil
  end
  def username=(value)
    write_attribute(:username, value.downcase)
  end


  def is_superuser?
    self.admin
  end

  def to_s
    self.username
  end

  def avatar_path
    if avatar.nil?
      nil
    else
      avatar.path
    end
  end

  def is_guest
    is_guest?
  end
  def is_guest?
    password_digest.nil?
  end
  def guest
    is_guest?
  end
  def guest?
    is_guest?
  end

  def self.guest
    user = User.create
    user.username = "Guest_#{user.id}"
    user.save
    user
  end

  def absorb_data(user)
    self.courses << user.courses
    user.reload
    user.destroy
  end

end
