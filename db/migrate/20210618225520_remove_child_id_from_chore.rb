# frozen_string_literal: true

class RemoveChildIdFromChore < ActiveRecord::Migration[5.0]
  def change
    remove_column :chores, :child_id, :integer
  end
end
