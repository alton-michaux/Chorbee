# frozen_string_literal: true

class RemoveChoreIdFromChild < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :chore_ids, :integer
  end
end
