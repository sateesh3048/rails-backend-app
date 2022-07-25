class InvitationsController < ApplicationController
  before_action :authenticate_user!

  # POST /invitations
  def create
    @invitation = current_user.invitations.new(invitation_params)
    if @invitation.save
      UserInvitationMailer.with(user: current_user, invitation: @invitation).welcome_email.deliver_now
      msg = { type: 'success', msg: 'User invitation got sent!' }
      render json: msg, status: :created, location: @invitation
    else
      puts @invitation.errors.inspect
      msg = { type: 'error', errors: @invitation.errors, msg: 'User invitation got failed!' }
      render json: msg, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
