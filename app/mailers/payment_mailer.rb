class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.invoice.subject
  def creation_confirmation_agent(service)
    @service = service

    mail(
      to:       @service.user.email,
      subject:  "Your payment Invoice"
    )
  end

  def creation_confirmation_client(service)
    @service = service

    mail(
      to:       @service.email,
      subject:  "Your payment Invoice"
    )
  end
end
