class Avatar < ActiveRecord::Base
  belongs_to :user

  FACES  = %w{angry bored confused happy normal sunglasses}
  HEADS  = %w{bow ninja pirate plain top_hat}
  COLORS = %w{blue gold gray green purple red}

  def avatar_path
    path = "skels/#{FACES[face]}"
    path << "/#{HEADS[head]}" if head
    path << "/#{COLORS[color]}" if color
    path
  end
end
