class UserNotifier < ActionMailer::Base
  default from: "nithya@muziboo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Hi"
    mail(to:"nithyarajar@gmail.com", sub:"Welcome to Devfolio")
  end
end
