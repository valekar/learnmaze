class RegistrationsController <  Devise::RegistrationsController

  def new
    super
  end



  def update
    super
  end



  protected

  def after_sign_up_path_for(resource)
    select_community_index_path
  end

  def after_inactive_sign_up_path_for(resource)
    select_community_index_path
  end


end
