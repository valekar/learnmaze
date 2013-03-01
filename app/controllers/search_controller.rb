class SearchController < ApplicationController
  def search
    @search = Spec.search do
      fulltext params[:search]
    end

    @results = @search.results

   # @results.each do |result|
        @user_ids = Spec.find_user(@results)
    #end


  end
end
