class AddChoresRefToChildren < ActiveRecord::Migration[5.0]
  def change
    add_reference :children, :chores, foreign_key: true
  end
end
