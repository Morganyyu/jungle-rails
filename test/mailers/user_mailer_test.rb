class UserMailerPreview < ActionMailer::Preview
  def receipt_email(order)
    UserMailer.with(order).receipt_email
  end
end