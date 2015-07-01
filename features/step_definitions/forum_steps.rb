Given(/^there should not be a forum in this outpost$/) do
  expect(@player.world.outpost.has_forum?).to be false
end