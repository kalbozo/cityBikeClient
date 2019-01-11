class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.string :name
      t.string :href, null: false, index: { unique: true }
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
