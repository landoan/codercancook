class Food < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :orders, through: :food_orders
end
