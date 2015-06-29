Given(/^I have enough mana$/) do
  @player = Player.create
  @player.add_mana Portal.cost
end

When(/^I am in a world with open portal spaces$/) do
  @a_world = World.create
  expect(@a_world.open_portals.size).to be > 0

  @player.set_location @a_world
  expect(@player.world).to be @a_world
  expect(@player.nearby_portals.size).to eq 0
end

When(/^There is another world with open portal spaces$/) do
  @b_world = World.create
  expect(@b_world.closed_portals.size).to be > 0
end

Then(/^I can open a portal to a new world$/) do
  pending
  # @player.open_portal_to @b_world
  # expect(Portal.exists_between(@a_world, @b_world)).to be true
end

Then(/^I can travel through the east portal$/) do
  expect(@player.mana >= Portal.cost).to be true
  expect(@player.nearby_portals.include? :east).to be true
end


Then(/^I can create a portal to the (.+)/) do |direction|
  expect(@player.world.closed_portals.include? direction.to_sym)
  expect(@player.mana >= Portal.cost).to be true
end

Then(/^I should see that the (.+) portal is open$/) do |direction|
  expect(@player.world.open_portals.include? direction.to_sym).to be true
end

Then(/^I should see that the (.+) portal is closed/) do |direction|
  expect(@player.world.closed_portals.include? direction.to_sym).to be true
end

Then(/^I should see that the south portal space is free$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^there should be closed portals$/) do
  expect(@player.world.closed_portals.size > 0).to be true
end
