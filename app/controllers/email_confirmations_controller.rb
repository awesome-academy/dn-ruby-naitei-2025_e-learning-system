class EmailConfirmationsController < ApplicationController
  skip_before_action :authenticate_user!
  def edit
    user = User.find_signed(params[:id], purpose: :account_activation)

    if user && user.confirmed_at.nil?
      user.update!(confirmed_at: Time.current)

      session[:user_id] = user.id

      redirect_back_or root_path
      flash[:notice] = t("email_confirmation.success")
    else
      redirect_to root_path,
                  alert: t("email_confirmation.invalid_link")
    end
  end
end
