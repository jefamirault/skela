class Post < ActiveRecord::Base
  belongs_to :conversation
  has_one :forum, through: :conversation


end
