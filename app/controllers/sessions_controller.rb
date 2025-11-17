class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create], raise: false

  # GET /login
  def new
    return unless logged_in?

    redirect_based_on_role
  end

  # POST /login
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:notice] = t("sessions.login_success", name: user.name)

      redirect_based_on_role(user)
    else
      flash.now[:alert] = t("sessions.login_failed")
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: t("sessions.logout_success")
  end

  private

  def redirect_based_on_role user = current_user
    if user.admin?
      redirect_to admin_courses_path
    else
      redirect_to root_path
    end
  end
end
