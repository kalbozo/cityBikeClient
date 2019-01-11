class SearchesController < ApplicationController
    def index
        if(params.has_key? :city)
            @search = Search.where(:city => params[:city]).first
            unless @search.nil?
                puts "====== render the cached search ======="
                render json: @search.networks
            else
                @search = Search.where(:city => params[:city]).first_or_create
                @networks = Network.where('city LIKE ?', params[:city]+"%")
                @search.networks = @networks
                render json: @networks
            end
        end
    end
end
