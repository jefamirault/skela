class Challenge < ActiveRecord::Base
  belongs_to :quest

  def next
    index = quest.challenges.index self
    quest.challenges[index + 1]
  end

end
