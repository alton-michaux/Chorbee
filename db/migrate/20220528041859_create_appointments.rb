class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :frequency
      t.boolean :done?
    end
  end
end
