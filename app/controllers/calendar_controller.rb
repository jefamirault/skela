class CalendarController < ApplicationController
  def agenda
    stuff = %w{assignments exams readings}.map do |category|
      current_user.send(category).select {|i| !i.date.nil?}
    end.reduce :+

    @groups = {
      past_7_days: stuff.select {|i| i.date > 7.days.ago && i.date < Date.today },
      today:       stuff.select {|i| i.date == Date.today},
      this_week:   stuff.select {|i| i.date > Date.today && i.date < Date.today + 1.week},
      next_week:   stuff.select {|i| i.date >= (Date.today + 1.week) && i.date < (Date.today + 2.weeks)}
    }
  end
end
