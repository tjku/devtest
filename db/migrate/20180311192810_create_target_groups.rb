class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name
      t.integer :external_id
      t.references :parent
      t.integer :secret_code
      t.references :panel_provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
