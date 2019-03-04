# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/creation_confirmation
  def creation_confirmation
    service = Service.last
    PaymentMailer.creation_confirmation(service)
  end

end
