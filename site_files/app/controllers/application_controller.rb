# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # filter_parameter_logging :password
  helper_method :admin?

  def admin?
    Time.now - session[:login] < 1600 if session[:login]
  end

 protected

  def login_required
    if admin?
      return true
    else
      flash[:notice]="Página privada!"
      redirect_to root_url
      return false
    end
  end

end
