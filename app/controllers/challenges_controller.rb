class ChallengesController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @challenge = Challenge.find params[:id]
    render 'cards/edit'
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @quest = @challenge.quest
    @challenge.destroy

    @challenges = Challenge.all
    render 'quests/edit'
  end

  private

  def challenge_params
    params.require(:challenge).permit(:text, :answer)
  end
end
