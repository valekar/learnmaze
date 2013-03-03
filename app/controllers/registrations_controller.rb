class RegistrationsController <  Devise::RegistrationsController



  protected

  def after_sign_up_path_for(resource)
    select_community_index_path
  end



end
