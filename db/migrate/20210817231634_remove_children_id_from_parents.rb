class RemoveChildrenIdFromParents < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :children_id, :integer
  end
end
