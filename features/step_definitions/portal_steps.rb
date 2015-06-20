Given(/^I have enough mana$/) do
  @jef = Player.create
  @jef.add_mana Portal.cost
end

When(/^I am in a world with open portal spaces$/) do
  @a_world = World.create
  expect(@a_world.open_portals.size).to be > 0

  @jef.set_location @a_world
  expect(@jef.world).to be @a_world
  expect(@jef.nearby_portals.size).to eq 0
end

When(/^There is another world with open portal spaces$/) do
  @b_world = World.create
  expect(@b_world.open_portals.size).to be > 0
end

Then(/^I can open a portal to the other world$/) do
  @jef.open_portal_to @b_world
  expect(Portal.exists_between(@a_world, @b_world)).to be true
end

Then(/^I can travel to that world$/) do
  @jef.take_portal_to @b_world
  expect(@jef.world).to eq @b_world
end
