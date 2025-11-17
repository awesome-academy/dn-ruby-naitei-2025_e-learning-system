module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type.to_sym
    when :notice
      "success"
    when :alert
      "danger"
    else
      "info"
    end
  end

  def render_not_found path, message
    redirect_to path, alert: message
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def redirect_back_or default
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def authenticate_user!
    return if logged_in?

    store_location
    redirect_to login_path, alert: t("auth.please_login")
  end
end
