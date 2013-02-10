class RegistrationsController <  Devise::RegistrationsController

  def new
    super
  end

  def create

    @user = User.new(params[:user])


    if @user.save
      respond_to do |format|
        format.html {redirect_to "profile/#{current_user.id}" }
      end
    end
  end

  def update
    super
  end

end
