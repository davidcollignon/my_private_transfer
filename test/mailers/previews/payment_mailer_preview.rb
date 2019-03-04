# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/creation_confirmation_agent
  def creation_confirmation_agent
    service = Service.last
    PaymentMailer.creation_confirmation_agent(service)
  end

  #Preview this email at http://localhost:3000/rails/mailers/payment_mailer/creation_confirmation_client
   def creation_confirmation_client
    service = Service.last
    PaymentMailer.creation_confirmation_client(service)
  end

end
