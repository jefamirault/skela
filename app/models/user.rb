class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :password, on: :create

  has_attached_file :avatar, :styles => { :medium => '300x300>', :thumb => '100x100>' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def is_superuser?
    self.privelage_level == 1
  end

  def favorite_color
    'elephant'
  end

  validates_uniqueness_of :email
end
