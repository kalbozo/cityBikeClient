class SearchesController < ApplicationController
  def index
    @networks = (params.has_key?(:city)) ? Network.where('city LIKE ?', params[:city]+"%") : Network.all
    render json: @networks
  end
end
