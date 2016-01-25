module Persistence
  class UserMailer < ApplicationMailer
    default from: 'winston@winstondigital.com'

    def welcome_email(user)
      @user = user
      @url  = 'http://winston-mobile.leanrails.com/users/sign_in'
      mail(to: @user.email, subject: 'Welcome to WINSTON. Your digital assistant.')
    end

  end
end
