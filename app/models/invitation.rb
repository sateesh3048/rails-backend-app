class Invitation < ApplicationRecord
  # validations
  validates :email, presence: true,
                    format: { with: Devise.email_regexp, message: 'invalid email' }

  # associations
  belongs_to :user

  # callbacks
  after_commit :send_invitation_mail

  private

  def send_invitation_mail; end
end
