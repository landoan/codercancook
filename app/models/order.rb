class Order < ActiveRecord::Base
  has_many :food_orders
end
