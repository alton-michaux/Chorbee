class AddDoneToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :done?, :boolean, default: 'false'
  end
end
