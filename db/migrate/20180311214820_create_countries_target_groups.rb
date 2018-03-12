class CreateCountriesTargetGroups < ActiveRecord::Migration
  def change
    create_table :countries_target_groups do |t|
      t.references :country, index: true, foreign_key: true
      t.references :target_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
