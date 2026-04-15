class RenameDoneToCompleted < ActiveRecord::Migration[7.2]
  def change
    rename_column :appointments, :"done?", :completed
  end
end
