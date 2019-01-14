class SearchesController < ApplicationController
    def networks
        if(params.has_key? :city)
            params[:city].downcase!
            search = Search.where(:city => params[:city]).first
            #if the search was ran already within the last 15min then use cached data
            unless (search.nil?) || (search.updated_at < 15.minute.ago)
                render json: search.networks
            else
                search = Search.where(:city => params[:city]).first_or_create
                @networks = Network.where('city LIKE ?', params[:city]+"%")
                search.networks = @networks
                search.touch #update the updated_at field
                render json: @networks
            end
        end
    end
    def stations
        if(params.has_key? :city)
            params[:city].downcase!
            search = Search.where(:city => params[:city]).first
            #if the search was ran already within the last 15min then use cached network data
            unless (search.nil?) || (search.updated_at < 15.minute.ago)
                networks = search.networks
            else
                search = Search.where(:city => params[:city]).first_or_create
                networks = Network.where('city LIKE ?', params[:city]+"%")
                search.networks = networks
                search.touch #update the updated_at field
            end
            @stations = []
            if networks
                networks.collect { |network|
                    response = HTTParty.get('http://api.citybik.es/'+network['href'])
                    if response.success?
                        @stations.push(JSON.parse(response.body))
                    else
                        raise response.response
                    end
                }
            end
            render json: @stations
        end
    end
end
