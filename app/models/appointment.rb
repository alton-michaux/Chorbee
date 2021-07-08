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

  def schedule(start= Time.zone.now.to_date)
    IceCube::Schedule.new(start) do |s|
      s.add_recurrence_rule IceCube::Rule.daily.until(Date.today + 30) if frequency === 'Daily'
      s.add_recurrence_rule IceCube::Rule.weekly.until(Date.today + 30) if frequency === 'Weekly'
    end
  end

  def calendar_events(start)
    start_date = start.beginning_of_month.beginning_of_week
    end_date = start.end_of_month.end_of_week
    schedule(start_date).occurrences(end_date).map do |date|
      Appointment.new(id: id, frequency: frequency, chore_id: chore_id, start_time: date)
    end
  end

  def from_hash
    hash = schedule.to_hash
    IceCube::Schedule.from_hash(hash)
  end
end
