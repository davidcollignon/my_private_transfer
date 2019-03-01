class ApplicationMailer < ActionMailer::Base
  default from: 'my-private-transfer-staging.herokuapp.com'
  layout 'mailer'
end
