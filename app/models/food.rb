class Food < ActiveRecord::Base
  belongs_to :section
  has_many :food_orders
end
