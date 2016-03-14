class FoodOrdersController < ApplicationController
  before_filter :add_foods, only: [:show, :create]

  def add_to_order
    session[:foods_order] ||= []
    session[:foods_order] << params[:food_id]
    @orders_count = session[:foods_order].count
  end

  def show
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.total_order = 0
    @foods.each do |f|
      @order.total_order = @order.total_order + f.price
    end
    @order.total_order = @order.total_order + 30
    if (@order.coupon == "CODERSCHOOL")
      @order.total_order = @order.total_order/2
    end
    if @order.valid?
      @order.foods = @foods
      @order.save
      render 'thank_you'
      session[:foods_order] = []
      CoderRestaurantMailer.order_info_email(@order, @foods).deliver_now
    else
      render 'show'
    end
  end

  def test_email
    raise Rails.configuration.action_mailer.smtp_settings
    CoderRestaurantMailer.test_email.deliver_now
  end

  private
  def add_foods
    @foods = []
    session[:foods_order].each do |s|
      @foods << Food.find_by_id(s)
    end
    @count = @foods.count()
  end

  def order_params
    params.require(:order).permit(:name, :phone, :email, :address, :coupon)
  end
end
