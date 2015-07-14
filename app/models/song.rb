class Song < ActiveRecord::Base

  def listen
    !!(url =~ /.+\.(mp3|midi|ogg)/)
  end
end
