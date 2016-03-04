class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :password, on: :create,
                        unless: Proc.new { |a| a.is_guest }
  validates_presence_of :username,
                        unless: Proc.new { |a| a.is_guest }
  validates_uniqueness_of :username,
                        unless: Proc.new { |a| a.is_guest }

  has_many :courses
  has_many :assignments, through: :courses
  has_many :exams, through: :courses
  has_many :readings, through: :courses
  has_many :resources, through: :courses

  has_one :avatar

  scope :guests, -> { where(password_digest: nil) }

  after_save :update_last_active

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

  private

  def update_last_active
    write_attribute :last_active, Time.now
  end

end
