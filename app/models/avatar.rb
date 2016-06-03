class Avatar < ActiveRecord::Base
  belongs_to :user

  FACES  = %w{angry bored confused happy normal sunglasses}
  HEADS  = %w{bow ninja pirate plain top_hat}
  COLORS = %w{blue gold gray green purple red}

  def self.default
    'skels/normal/plain'
  end

  def path
    path = "skels/#{face}"
    path << "/#{head}" if head
    if head == 'bow' || head == 'ninja' || head == 'top_hat'
      path << "/#{color}"
    end
    path
  end

  def face=(new_face)
    set_by_string_or_index :face, new_face
  end
  def face
    face_index ? FACES[face_index] : nil
  end
  def face_index
    (read_attribute :face) || 4
  end

  def head=(new_head)
    set_by_string_or_index :head, new_head
  end
  def head
    head_index ? HEADS[head_index] : nil
  end
  def head_index
    (read_attribute :head) || 3
  end

  def color=(new_color)
    set_by_string_or_index :color, new_color
  end
  def color
    color_index ? COLORS[color_index] : nil
  end
  def color_index
    (read_attribute :color) || 0
  end

  def increment_face
    self.face = (face_index + 1) % FACES.size
    save
  end

  def increment_head
    self.head = (head_index + 1) % HEADS.size
    save
  end

  def increment_color
    self.color = (color_index + 1) % COLORS.size
    save
  end

  private

  def set_by_string_or_index(field, value)
    type = value.class
    if type == String
      write_attribute field, send(field.to_s.upcase).index(value)
    elsif type == Fixnum
      write_attribute field, value
    else
      raise "cannot set avatar #{field} using type: #{type}"
    end
  end
end
