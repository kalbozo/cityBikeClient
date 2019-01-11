class NetworksController < ApplicationController

  respond_to :html, :json
  def index
    @networks = Network.all
    render json: @networks

  end

  def update_networks
    response = HTTParty.get('http://api.citybik.es/v2/networks')

    if response.success?
      networks = JSON.parse(response.body)
      networks['networks'].each do |network|
        Network.create([{:name=> network['id'], :href => network['href'], :city => network['location']['city'], :longitude => network['location']['longitude'], :latitude => network['location']['latitude']}])
      end 
    else
      raise response.response
    end
  end #update_networks
end
