# Preview all emails at http://localhost:3000/rails/mailers/service_mailer
class ServiceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/service_mailer/transfer_confirmation
  def transfer_confirmation
    ServiceMailer.transfer_confirmation
  end

end
