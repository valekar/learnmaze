class ApplicationController < ActionController::Base
  protect_from_forgery
  def param_posted?(sym)
    request.post? and params[sym]
  end



  def protect
    unless user_signed_in?
      session[:protected_page] = request.env['REQUEST_URI']
      flash[:notice] = "Please Log in Frist"

      redirect_to new_user_session_path
      return false

    end
  end


  def current_ability
    @current_ability ||= Ability.new(current_user)
  end





  # this is for checking the javascript enabling on the client side
  JAVASCRIPT_TIME_LIMIT = 10.seconds

  before_filter :prepare_javascript_test

  private
  def prepare_javascript_test
    if (session[:javascript_updated].blank? or
        Time.now - session[:javascript_updated] > ApplicationController::JAVASCRIPT_TIME_LIMIT)
      @javascript_active = true
    else
      @javascript_active = false
    end
  end

end
