class CreateFoodsOrders < ActiveRecord::Migration
  def change
    create_table :foods_orders do |t|
      t.integer :food_id
      t.integer :order_id
    end
  end
end
