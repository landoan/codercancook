# Preview all emails at http://localhost:3000/rails/mailers/coder_restaurant_mailer
class CoderRestaurantMailerPreview < ActionMailer::Preview
  def order_info_email_preview
    CoderRestaurantMailer.order_info_email(Order.first)
  end
end
