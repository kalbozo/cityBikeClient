class SearchesController < ApplicationController
    def networks
        if(params[:city].present?)
            #ensure that we only submit lowercase citys. (Cross platform case insensitive)
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
                if(params[:sort].present?)
                    @networks.sort_by!{|x| x[params[:sort]]}
                end
                render json: @networks
            end
        else
            @output = {:error => "No city specified"}
            render json: @output
        end
    end
    def stations
        if(params[:city].present?)
           #ensure that we only submit lowercase citys. (Cross platform case insensitive)
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
            @output = []
            if networks
                networks.collect { |network|
                    # Since I am not caching stations yet, we must grab them from the server
                    response = HTTParty.get('http://api.citybik.es/'+network['href']+'?fields=stations')
                    if response.success?
                        station_array = JSON.parse(response.body)['network']['stations']
                        station_array.each do |station|
                           @output.push(station)
                        end
                    else
                        @output = {:error => "External API failure"}
                        break
                    end
                }
            end
            if(params[:sort].present?)
                @output.sort_by!{|x| x[params[:sort]]}
            end
        else
            @output = {:error => "No city specified"}
        end
        render json: @output
    end
end
