class Order < ActiveRecord::Base
  has_and_belongs_to_many :foods, through: :food_orders

  validates :name, :address, :email, :phone, presence: true
end
