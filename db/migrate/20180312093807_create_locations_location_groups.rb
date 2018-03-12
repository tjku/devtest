class CreateLocationsLocationGroups < ActiveRecord::Migration
  def change
    create_table :locations_location_groups do |t|
      t.references :location, index: true, foreign_key: true
      t.references :location_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
