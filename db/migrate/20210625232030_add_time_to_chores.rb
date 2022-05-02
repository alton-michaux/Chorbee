class AddTimeToChores < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :start_time, :datetime
    add_column :chores, :done?, :boolean
  end
end
