class AddCouponToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :coupon, :string
  end
end
