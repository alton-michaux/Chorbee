# frozen_string_literal: true

class Appointment < ApplicationRecord
  validates :start_time, presence: true
  validates :chore_id, presence: true
  validates :frequency, presence: true

  validates_associated :chore

  belongs_to :chore
end
