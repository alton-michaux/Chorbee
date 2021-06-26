# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.references :chore, foreign_key: true

      t.timestamps
    end
  end
end
