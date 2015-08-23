class QuestsController < ApplicationController
  def index
    @quests = if current_user
      (current_user.quests + Quest.where(published: true)).uniq
    else
      Quest.where(published: true)
    end
    render 'cards/index'
  end

  def new
    @quest = Quest.create
    @quest.creator = current_user
    @quest.save
    render 'cards/new'
  end

  def edit
    @quest = Quest.find(params[:id])
    render 'cards/edit'
  end

  def update
    @quest = Quest.find(params[:id])
    @quest.update(quest_params)
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy

    @quests = Quest.all
    render 'cards/index'
  end

  def new_challenge
    @quest = Quest.find params[:id]

    @challenge = Challenge.create
    @challenge.quest = @quest

    @quest.challenges << @challenge

    render 'challenges/edit'
  end

  def play
    @quest = Quest.find params[:id]
    @challenge = @quest.challenges.first
  end

  def attempt_challenge
    @challenge = Challenge.find params[:challenge_id]
    attempt = params[:challenge][:answer]

    if attempt == @challenge.answer
      @message = 'You got it!'
      @challenge = @challenge.next
      if @challenge
        render 'play'
      else
        @message << ' You win!'
        render js: "alert('#{@message}')"
      end
    else
      message = 'Incorrect'
      render js: "alert('#{message}')"
    end

  end

  private

  def quest_params
    params.require(:quest).permit(:title, :published)
  end
end
