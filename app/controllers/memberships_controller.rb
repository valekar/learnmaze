class MembershipsController < ApplicationController


  def create
      @community = Community.find(params[:membership][:community_id])

      #@membership =Membership.new()

     # @membership.community_id = params[:membership][:community_id]

     @membership = current_user.join(@community)


     if @membership.save
        redirect_to select_community_index_path
     end

  end

  def destroy
    @membership = Membership.find_by_id(params[:id])

    @community = @membership.community

    if @membership.delete
      redirect_to select_community_index_path
    end

  end



end
