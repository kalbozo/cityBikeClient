class CreateNetworksSearches < ActiveRecord::Migration[5.2]
  def self.up
    create_table :networks_searches, :id => false do |t|
      t.integer :network_id
      t.integer :search_id
    end
  end

  def self.down
    drop_table :networks_searches
  end
end

