class SearchController < ApplicationController

  def index
    @stores = Store.create_stores(params[:q], 25)
  end

end
