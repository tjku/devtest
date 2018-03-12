class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :external_id
      t.integer :secret_code

      t.timestamps null: false
    end
  end
end
