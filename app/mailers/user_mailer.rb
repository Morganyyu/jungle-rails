class UserMailer < ApplicationMailer

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Order#{@order.id}")
  end
end
