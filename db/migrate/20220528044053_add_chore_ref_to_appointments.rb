class AddChoreRefToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :chore, foreign_key: true
  end
end
