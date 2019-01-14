class NetworksController < ApplicationController

  def update_networks
    current_time = Time.now
    response = HTTParty.get('http://api.citybik.es/v2/networks')

    if response.success?
      networks = JSON.parse(response.body)
      networks['networks'].each do |network|
        #begin
          network_model = Network.where(:href => network['href']).first_or_create(:city => network['location']['city'])
          Network.update(network_model.id, :city => network['location']['city'], :longitude => network['location']['longitude'], :latitude => network['location']['latitude'],:name=> network['id'])
          
        #rescue
        #  next
        #end
      end
      #destroy all non-updated networks. This means they didnt exist on the api
      Network.where("updated_at < ?", current_time).destroy_all
    else
      raise response.response
    end
  end #update_networks
end
