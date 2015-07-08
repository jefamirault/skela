Given(/^I am a skela user$/) do
  @user = User.create
end

Then(/^I can create an unassigned shift for next Friday from (\d+)pm to (\d+)pm$/) do |arg1, arg2|
  start_time = get_next_weekday(:friday).to_datetime.change hour: arg1.to_i + 12
  end_time   = get_next_weekday(:friday).to_datetime.change hour: arg2.to_i + 12
  shift = @user.create_shift(start_time: start_time, end_time: end_time)
  expect(shift.new_record?).to be false
end

Given(/^I do not have any shift tomorrow from (\d+)am to (\d+)pm$/) do |arg1, arg2|
  @user = User.create
end

Then(/^I can schedule a shift tomorrow from (\d+)am to (\d+)pm$/) do |arg1, arg2|
  start_time = Date.tomorrow.change hour: arg1
  end_time   = Date.tomorrow.change hour: arg2
  shift = @user.create_shift start_time: start_time, end_time: end_time
  expect(shift.nil?).to be false
end

Given(/^I do not have a shift in the last (\d+) hours$/) do |arg1|
  @user = User.create
end

Then(/^I can create a (\d+) hour shift that ends now$/) do |arg1|
  start_time = 4.hours.ago
  end_time = DateTime.now
  shift = @user.create_shift start_time: start_time, end_time: end_time
  expect(shift.nil?).to be false
end

Given(/^I have an upcoming shift$/) do
  @user = User.create
  start_time = 2.hours.from_now
  end_time   = 6.hours.from_now
  @shift = Shift.new start_time: start_time, end_time: end_time
  @shift.user = @user
  @shift.save
  expect(@shift.nil?).to be false
  expect(@shift.user).to be @user
end

Then(/^I can create a todo item for that shift$/) do
  todo = Task.new title: 'Get shift done'
  @shift.tasks << todo
  expect(@shift.tasks).to include todo
  expect(todo.taskable).to eq @shift
end

Given(/^I am on a shift$/) do
  @user = User.create
  start_time = 2.hours.ago
  end_time   = 2.hours.from_now
  @shift = Shift.new start_time: start_time, end_time: end_time
  @shift.user = @user
  @shift.save
  expect(@shift.nil?).to be false
  expect(@shift.user).to be @user
end

Then(/^I can create a complete todo item for my shift$/) do
  todo = Task.new title: 'Get shift done', complete: true
  @shift.tasks << todo
  expect(@shift.tasks).to include todo
  expect(todo.taskable).to eq @shift
  expect(todo.complete).to be true
end
