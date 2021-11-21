class ApplicationMailer < ActionMailer::Base
  default to: "rb01143@surrey.ac.uk", from: 'from@example.com'
  layout 'mailer'
end
