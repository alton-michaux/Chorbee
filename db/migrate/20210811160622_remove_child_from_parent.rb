# frozen_string_literal: true

class RemoveChildFromParent < ActiveRecord::Migration[5.0]
  def change
    remove_column :parents, :child, :string
  end
end
