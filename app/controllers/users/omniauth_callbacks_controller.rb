class Users::OmniauthCallbacksController < ApplicationController



  def passthru
    send(params[:provider]) if providers.include?(params[:provider])
  end





  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    auth = request.env["omniauth.auth"]


    if @user
     # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
     # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    #  @user = User.new_with_session(params[:user],session)
    #  redirect_to facebook_url

       redirect_to root_url

    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]

      session["facebook_data"] = request.env["omniauth.auth"].except('extra')

      #raise session["devise.facebook_data"].to_yaml

      redirect_to controller:"/external" ,action:"index"
    end
  end

  def twitter
    raise "Implement me for twitter"
  end

  private

  def providers
    ["facebook", "twitter"]
  end



end
