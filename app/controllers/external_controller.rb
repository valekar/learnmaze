class ExternalController < ApplicationController

    def index
      @user = User.new
      @user.spec ||= Spec.new

       #@data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        @facebook_data = session["devise.facebook_data"]
      @spec = @user.spec


    end


    def linkedin
      @user = User.new
      @user.spec ||= Spec.new
      @linkedin_data = session["devise.linkedin_data"]
      @spec = @user.spec
    end


    def create

      #@data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]

      @facebook_data = session["devise.facebook_data"]  if session["devise.facebook_data"]
      @linkedin_data = session["devise.linkedin_data"]  if session["devise.linkedin_data"]

      @user = User.new(params[:user])

      if  @user.save
        @user.spec ||= Spec.new
        @spec = @user.spec

        if @facebook_data
          if @facebook_data.info.gender  == "male"
            @gender = "Male"
          else
            @gender = "Female"

          end
        end


        if @linkedin_data
          @user.spec.update_attributes(:first_name => @linkedin_data.info.first_name,last_name:@linkedin_data.info.last_name,remote_image_url:@linkedin_data.info.image(:original),college:@linkedin_data.info.industry)

        elsif @facebook_data
          @user.spec.update_attributes(:first_name => @facebook_data.info.first_name,last_name:@facebook_data.info.last_name,gender:@gender,remote_image_url:@facebook_data.info.image.sub("square","large"))

        end


         sign_in @user,event: :authentication
       # sign_in_and_redirect_to @user, :event => :authentication
        redirect_to select_community_index_path
      else
        redirect_to root_url


      end


    end


end
