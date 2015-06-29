Given(/^I am a player in a new world$/) do
  world1 = World.create

  @player = Player.create
  @player.set_location world1
end

When(/^I create an outpost$/) do
  @player.create_outpost
  expect(@player.world.has_outpost?).to be true
end

Then(/^I receive influence$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have (\d+) influence$/) do |arg1|
  @player.set_influence arg1
end

Given(/^I have (\d+) supporters$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can create a forum$/) do
  @player.create_forum
end

Then(/^I can create a tower$/) do
  @player.create_tower
end
