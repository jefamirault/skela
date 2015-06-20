Given(/^I am a skela user without a player account$/) do
  @user = User.create username: 'jef'
  expect(@user.player).to be nil
end

When(/^I create a player account$/) do
  @player = @user.create_player_account
  expect(@user.player).not_to be nil
  expect(@player).not_to be nil
end

Then(/^My player is in Home World$/) do
  expect(@player.world).to eq World.home
end

Then(/^I have enough mana to create a Portal$/) do
  expect(@player.mana).to be >= Portal.cost
end
