class SearchesController < ApplicationController
    def index
        if(params.has_key? :city)
            @search = Search.where(:city => params[:city]).first
            #if the search was ran already within the last 15min then use cached data
            unless (@search.nil?) || (@search.updated_at < 15.minute.ago)
                render json: @search.networks
            else
                @search = Search.where(:city => params[:city]).first_or_create
                @networks = Network.where('city LIKE ?', params[:city]+"%")
                @search.networks = @networks
                @search.touch #update the updated_at field
                render json: @networks
            end
        end
    end
end
