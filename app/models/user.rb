class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :password, on: :create
  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :courses
  has_many :assignments, through: :courses
  has_many :purchases

  belongs_to :world
  has_one :player

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
end
