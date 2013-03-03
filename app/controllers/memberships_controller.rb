class MembershipsController < ApplicationController


  def create
      @community = Community.find(params[:membership][:community_id])

      #@membership =Membership.new()

     # @membership.community_id = params[:membership][:community_id]

     @membership = current_user.join(@community)

     respond_to do |format|
      if @membership.save
         if session["devise.facebook_data"] || session["devise.linkedin_data"]
          format.html  {redirect_to select_community_index_path}
         else
           format.html {redirect_to communities_path}
         end
      end
     end

  end

  def destroy
    @membership = Membership.find_by_id(params[:id])

    @community = @membership.community

    respond_to do |format|
    if @membership.delete
      if session["devise.facebook_data"] || session["devise.linkedin_data"]
        format.html  {redirect_to select_community_index_path}
      else
        format.html {redirect_to communities_path}
      end
    end
    end


  end



end
