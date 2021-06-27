# frozen_string_literal: true

class AddFrequencyToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :frequency, :string
  end
end
