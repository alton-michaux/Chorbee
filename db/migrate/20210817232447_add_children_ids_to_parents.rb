class AddChildrenIdsToParents < ActiveRecord::Migration[5.0]
  def change
    add_index(:parents, %i[children_ids parent_id], unique: true)
  end
end
