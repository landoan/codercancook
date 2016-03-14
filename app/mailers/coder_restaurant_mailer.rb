class CoderRestaurantMailer < ApplicationMailer
  default from: "retaurant@codercancook.com"

  def order_info_email( order, foods )
    @order = order
    @foods = foods
    mail(to: @order.email, subject: 'Order information for ' + @order.name)

  end

  def test_email
    mail(to: "landoan.light@gmail.com", subject: 'Order information for ')
  end
end
