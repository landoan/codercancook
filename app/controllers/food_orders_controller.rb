class FoodOrdersController < ApplicationController
  def add_to_order
    session[:foods_order] ||= []
    session[:foods_order] << params[:food_id]
    @orders_count = session[:foods_order].count
  end

  def show
    @foods = []
    session[:foods_order].each do |s|
      @foods << Food.find_by_id(s)
    end
    @count = @foods.count()
    @order = Order.new

  end

  def create
    @order = Order.new(name: params[:name], phone: params[:phone], email: params[:email], address: params[:address])
    if @order.save()

      session[:foods_order].each {
          |id|
        @order.food_orders.create(food_id: id)
      }
    end
  end

  def order_params
    params.require(:order).permit(:name, :phone, :email, :address)
  end
end
