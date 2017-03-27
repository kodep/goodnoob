class UserMailer < ApplicationMailer
  def welcome user
    @user = user
    case user.locale
    when 'en'
      subject = 'Welcome to GoodNoob!'
    when 'fr'
      subject = 'Bienvenue sur GoodNoob!'
    when 'es'
      subject = 'Bienvenido a GoodNoob!'
    else
      subject = 'Welcome to GoodNoob!'
    end

    mail to: user.email, subject: subject
  end
end
