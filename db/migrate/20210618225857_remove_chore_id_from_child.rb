class RemoveChoreIdFromChild < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :chore_id, :integer
  end
end
