class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(order: Order.first).receipt_email
  end
end