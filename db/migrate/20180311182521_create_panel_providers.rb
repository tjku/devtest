class CreatePanelProviders < ActiveRecord::Migration
  def change
    create_table :panel_providers do |t|
      t.integer :code, null: false, index: { unique: true }

      t.timestamps null: false
    end
  end
end
