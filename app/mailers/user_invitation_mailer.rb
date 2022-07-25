class UserInvitationMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @invitation = params[:invitation]
    @url = 'http://localhost:3000/'
    mail(to: @invitation.email, subject: 'Welcome to My Awesome Site')
  end
end
