# frozen_string_literal: true

class CreateJoinTableChoreChild < ActiveRecord::Migration[5.0]
  def change
    create_join_table :chores, :children do |t|
      # t.index [:chore_id, :child_id]
      # t.index [:child_id, :chore_id]
    end
  end
end
