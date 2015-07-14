When(/^I select a song to upload$/) do
  @song = Song.new
  @song.url = 'improv1.midi'
  @song.save

end

Then(/^I should be able to view that song$/) do
  expect(@song.new_record?).to be false
end

Then(/^I should be able to listen to that song$/) do
  expect(@song.listen).to be true
end

