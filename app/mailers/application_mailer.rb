class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.config.site_email
  layout 'mailer'
end
