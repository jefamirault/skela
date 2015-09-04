Given(/^I am a skela admin$/) do
  @admin = User.new username: 'admin', privilege_level: 1
end

When(/^I create an issue$/) do
  @issue = Issue.create
end

When(/^I create an issue with subject (.+)$/) do |subject|
  @issue = Issue.create subject: subject
end

Then(/^issue status should be (.+)$/) do |status|
  expect(@issue.status).to eq status
end

Then(/^issue should be unassigned$/) do
  expect(@issue.assignee).to eq 'Unassigned'
end

When(/^I mark that issue incomplete$/) do
  @issue.mark_incomplete
end


When(/^I mark that issue complete$/) do
  @issue.mark_complete
end


When(/^I assign that issue to (.+)$/) do |username|
  user = User.find_by_username username
  @issue.assign_to user
end

Then(/^issue assignee should be (.+)$/) do |username|
  user = User.find_by_username username
  expect(@issue.assignee).to eq user
end

Given(/^there is a user (.+)$/) do |username|
  @user = User.create username: username, password: 'secret'
end
