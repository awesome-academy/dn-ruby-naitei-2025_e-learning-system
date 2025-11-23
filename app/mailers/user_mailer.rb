class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    @token = user.signed_id(purpose: :account_activation, expires_in: 24.hours)

    mail to: user.email, subject: "Kích hoạt tài khoản E-Learning"
  end
end
