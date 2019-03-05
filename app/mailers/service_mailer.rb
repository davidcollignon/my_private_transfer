class ServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.transfer_confirmation.subject
  #
  def transfer_confirmation(service)
     @service = service

    mail(
      to:       "clauditiwiesiti@gmail.com",
      subject:  "Tranfer Confirmation"
    )
  end
end
