class AddBalanceToChildren < ActiveRecord::Migration[7.2]
  def change
    add_column :children, :balance, :decimal, precision: 8, scale: 2, default: 0, null: false
  end
end
