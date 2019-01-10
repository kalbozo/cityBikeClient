class NetworkController < ApplicationController
  
  def update_networks
    response = HTTParty.get('http://api.citybik.es/v2/networks')

    if response.success?
      networks = JSON.parse(response.body)
      networks['networks'].each do |network|
        Network.create({:name=> network['id'], :href => network['href']})
      end 
    else
      #raise response.response
    end
    return 0
  end #update_networks
end
