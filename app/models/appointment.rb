# frozen_string_literal: true

require 'ice_cube'
require 'active_support/time'

class Appointment < ApplicationRecord
  validates :start_time, presence: true
  validates :chore_id, presence: true
  validates :frequency, presence: true

  validates_associated :chore

  belongs_to :chore

  def each; end

  def schedule
    schedule = IceCube::Schedule.new(now = Time.now) do |s|
      if Appointment.frequency == 'Daily'
        s.add_recurrence_rule IceCube::Rule.daily.until(Date.today + 30)
        s.add_exception_time(now + 1.day)
      else
        s.add_recurrence_rule IceCube::Rule.weekly.until(Date.today + 30)
        s.add_exception_time(now + 1.week)
      end
    end

    # list occurrences until end_time (end_time is needed for non-terminating rules)
    # occurrences = schedule.occurrences(end_time) # [now]

    # # or all of the occurrences (only for terminating schedules)
    # occurrences = schedule.all_occurrences # [now, now + 2.days, now + 3.days]

    # # or check just a single time
    # schedule.occurs_at?(now + 1.day)  # false
    # schedule.occurs_at?(now + 2.days) # true

    # # or check just a single day
    # schedule.occurs_on?(Date.today) # true

    # # or check whether it occurs between two dates
    # schedule.occurs_between?(now, now + 30.days)          # true
    # schedule.occurs_between?(now + 4.days, now + 30.days) # false

    # # or the first (n) occurrences
    # schedule.first(2) # [now, now + 2.days]
    # schedule.first    # now

    # # or the last (n) occurrences (if the schedule terminates)
    # schedule.last(2) # [now + 2.days, now + 3.days]
    # schedule.last    # now + 3.days

    # # or the next occurrence
    # schedule.next_occurrence(from_time)     # defaults to Time.now
    # schedule.next_occurrences(4, from_time) # defaults to Time.now
    # schedule.remaining_occurrences          # for terminating schedules

    # # or the previous occurrence
    # schedule.previous_occurrence(from_time)
    # schedule.previous_occurrences(4, from_time)

    # # or include prior occurrences with a duration overlapping from_time
    # schedule.next_occurrences(4, from_time, spans: true)
    # schedule.occurrences_between(from_time, to_time, spans: true)

    # # or give the schedule a duration and ask if occurring_at?
    # schedule = IceCube::Schedule.new(now, duration: 3600)
    # schedule.add_recurrence_rule IceCube::Rule.daily
    # schedule.occurring_at?(now + 1800) # true
    # schedule.occurring_between?(t1, t2)

    # # using end_time also sets the duration
    # schedule = IceCube::Schedule.new(start = Time.now, end_time: start + 3600)
    # schedule.add_recurrence_rule IceCube::Rule.daily
    # schedule.occurring_at?(start + 3599) # true
    # schedule.occurring_at?(start + 3600) # false

    # # take control and use iteration
    # schedule = IceCube::Schedule.new
    # schedule.add_recurrence_rule IceCube::Rule.daily.until(Date.today + 30)
    # schedule.each_occurrence { |t| puts t }
  end
end
