class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Order #{@order.id}')
  end

end
