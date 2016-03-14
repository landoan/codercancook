class AddTotalOrderToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total_order, :decimal
  end
end
