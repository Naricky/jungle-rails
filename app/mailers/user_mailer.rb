class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)

    @order = order
    mail(to: order.email, subject: " #{@order.id} is your order id. your order has been received")
  end
end

