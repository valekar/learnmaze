class SearchController < ApplicationController
  def search
    @search = Spec.search do
      fulltext params[:search]
    end

    @emails = @search.results

  end
end
