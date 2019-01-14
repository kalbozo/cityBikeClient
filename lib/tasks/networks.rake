namespace :networks do
  desc "TODO"
  task update: :environment do
    controller = NetworksController.new
    controller.update_networks
  end

end
