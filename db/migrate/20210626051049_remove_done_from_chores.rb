class RemoveDoneFromChores < ActiveRecord::Migration[5.0]
  def change
    remove_column :chores, :done?, :boolean
  end
end
