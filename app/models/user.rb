class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :password, on: :create
  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :contexts

  has_many :courses
  has_many :assignments, through: :courses

  has_one :avatar

  def username
    database_says = read_attribute(:username)
    database_says ? database_says.downcase : nil
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

  def create_player_account
    if player.nil?
      self.player = Player.new
      player.name = username
      player.world = World.home
      player.mana = Portal.cost
      player.save
      player
    else
      false
    end
  end

  def create_shift(shift_params = {})
    shift = Shift.new shift_params
    shift.creator = self
    shift.save
    shift
  end

  def avatar_path
    if avatar.nil?
      nil
    else
      avatar.path
    end
  end
end
