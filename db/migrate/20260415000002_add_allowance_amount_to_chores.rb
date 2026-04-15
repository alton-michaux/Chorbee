class AddAllowanceAmountToChores < ActiveRecord::Migration[7.2]
  def change
    add_column :chores, :allowance_amount, :decimal, precision: 8, scale: 2, default: 0, null: false
  end
end
